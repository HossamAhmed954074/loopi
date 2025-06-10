import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_register_state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(LoginRegisterInitial());
  late String verificationId;
  FirebaseAuth auth = FirebaseAuth.instance;

  String? email;
  String? phone;

  Future<void> registerUser({
    required String email,
    required String password,
    String? name,
    String? phoneNumber,
    String? address,
    String? fromCity,
    String? toColleage,

  }) async {
    emit(LoginRegisterLoading());
    try {
      final _ = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .set({
            'name': name,
            'email': email,
            'id' : email,
            'phone': phoneNumber,
            'address': address,
            'fromCity': fromCity,
            'toColleage': toColleage,        
          });


      emit(LoginRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(LoginRegisterFailure('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(
          LoginRegisterFailure('The account already exists for that email.'),
        );
      }
    } catch (e) {
      emit(LoginRegisterFailure(e.toString()));
    }
  }



  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginRegisterLoading());
    this.email = email;
    try {
      final _ = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginRegisterFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginRegisterFailure('Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(LoginRegisterFailure(e.toString()));
    }
  }

  Future<void> submitedPhoneNumber(String phoneNumber) async {
    emit(LoginRegisterLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(minutes: 2),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
    phone = phoneNumber;
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException e) {
    emit(LoginRegisterFailure(e.toString()));
  }

  void codeSent(String verificationId, int? resendToken) async {
    this.verificationId = verificationId;
    emit(LoginRegisterSuccess());
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitedOTP(String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential c) async {
    try {
      await auth.signInWithCredential(c);
      emit(PhoneOtpVerified());
    } on FirebaseAuthException catch (e) {
      emit(LoginRegisterFailure(e.toString()));
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }

  User getLoggedInUser() {
    User firebaseUser = auth.currentUser!;
    return firebaseUser;
  }
}
