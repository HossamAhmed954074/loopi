import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';


part 'login_register_state.dart';

class LoginRegisterCubit extends Cubit<LoginRegisterState> {
  LoginRegisterCubit() : super(LoginRegisterInitial());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(LoginRegisterLoading());
    try {
      final _ = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
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

  Future<void> LoginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginRegisterLoading());
    try {
      final _ = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginRegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code =='user-not-found') {
        emit(LoginRegisterFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          LoginRegisterFailure('Wrong password provided for that user.'),
        );
      }
    } catch (e) {
      emit(LoginRegisterFailure(e.toString()));
    }
  }
}
