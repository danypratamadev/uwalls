import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uwalls/models/profile_model.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class AuthController extends GetxController {

  FirebaseAuth auth = FirebaseAuth.instance;
  ProfileModel profile = const ProfileModel();
  
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 1500), () => 
      getCurrentUser()
    );
  }

  void getCurrentUser() {
    if(auth.currentUser != null) {
      final User user = auth.currentUser!;
      setProfileUser(user: user);
    } else {
      AppNavigator.pushReplacement(route: AppRoutes.loginRoute);
    }
  }

  void setProfileUser({required User user}) {
    profile = ProfileModel(
      id: user.uid,
      photo: user.photoURL ?? '-',
      name: user.displayName ?? 'Full Name',
      email: user.email ?? 'Email Address',
      phone: user.phoneNumber ?? 'Phone Number',
    );
    AppNavigator.pushReplacement(route: AppRoutes.mainRoute);
  }

  //! SIGN IN ACCOUNT
  //? VARIABLE
  String email = '-';
  String password = '-';

  bool btnEnable = false;
  bool btnLoading = false;
  bool obscurePass = true;

  //? METHOD
  void onChangeObscure() {
    obscurePass = !obscurePass;
    update([AppStateId.obscurePass]);
  }

  void onChangeInput({required int action, required String value}) {
    if(action == 10) {
      email = value;
    } else {
      password = value;
    }
    btnEnable = validateInput();
    update([AppStateId.btnLogin]);
  }

  bool validateInput() {
    bool result = false;
    if((email != '-' && email.isNotEmpty && EmailValidator.validate(email)) && 
      (password != '-' && password.isNotEmpty && password.length > 5)) {
        result = true;
    }
    return result;
  }

  void loginAccount() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      ).then((value) {
        setProfileUser(user: value.user!);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('KESINI => USER NOT FOUND');
      } else if (e.code == 'wrong-password') {
        log('KESINI => PASSWORD INCORENT');
      } else {
        log('KESINI => ${e.code}');
      }
    }
  }

  //! REGISTER ACCOUNT
  //? VARIABLE
  String firstName = '-';
  String lastName = '-';
  String emailReg = '-';
  String passwordReg = '-';
  String confirmPassReg = '-';

  bool btnEnableReg = false;
  bool btnLoadingReg = false;
  bool obscurePassReg = true;
  bool obscureConfirmPassReg = true;

  //? METHOD
  void onChangeObscureReg({required int action}) {
    if(action == 10) {
      obscurePassReg = !obscurePassReg;
    } else {
      obscureConfirmPassReg = !obscureConfirmPassReg;
    }
    update([AppStateId.obscurePassReg]);
  }

  void onChangeInputReg({required int action, required String value}) {
    if(action == 10) {
      firstName = value;
    } else if(action == 20) {
      lastName = value;
    } else if(action == 30) {
      emailReg = value;
    } else if(action == 40) {
      passwordReg = value;
    } else {
      confirmPassReg = value;
    }
    btnEnableReg = validateInputReg();
    update([AppStateId.btnRegister]);
  }

  bool validateInputReg() {
    bool result = false;
    if(
      (firstName != '-' && firstName.isNotEmpty) && 
      (lastName != '-' && lastName.isNotEmpty) &&
      (emailReg != '-' && emailReg.isNotEmpty && EmailValidator.validate(emailReg)) && 
      (passwordReg != '-' && passwordReg.isNotEmpty && passwordReg.length > 5) &&
      (confirmPassReg != '-' && confirmPassReg.isNotEmpty && confirmPassReg == passwordReg)) {
        result = true;
    }
    return result;
  }

  void registerAccount() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailReg, 
        password: passwordReg,
      ).then((value) {
        setProfileUser(user: value.user!);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        log('KESINI => USER SUDAH TERDAFTAR');
      } else if (e.code == 'invalid-email') {
        log('KESINI => EMAIL NOT VALID');
      } else if(e.code == 'weak-password') {
        log('KESINI => PASSWORD WEAK');
      } else {
        log('KESINI => ${e.code}');
      }
    }
  }

  //! SIGN OUT ACCOUNT
  void logoutAccount() async {
    auth.signOut().then((value) => AppNavigator.push(route: AppRoutes.loginRoute));
  }

}