import 'package:final_project/constants/routs_constants.dart';
import 'package:final_project/views/login_register_screens/widgets/snackBarCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors_constants.dart';
import '../widgets/button_custom_widget.dart';
import '../widgets/text_button_custom.dart';
import '../widgets/text_form_field_custom_widget.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  String? emailAddress;
  String? password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Text(
                'Register',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
            
              TextFormFieldCustom(
                labelTitle: 'Email',
                onChanged: (val) => emailAddress = val,
              ),
              TextFormFieldCustom(
                labelTitle: 'Password',
                onChanged: (val) => password = val,
              ),
              SizedBox(height: 10),

              ButtonCustom(
                buttonTitle: 'Register',
                buttonColor: MyColor.kButtonLoginColor,
                textColor: Colors.white,
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                          email: emailAddress!,
                          password: password!,
                        );
                        snackBarCustom(context,'Account Created Successfully');
                       
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(height: 10),
              TextButtonCustom(
                textButton: 'Already have Account',
                onPressed: () => Navigator.pop(context, logInScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
