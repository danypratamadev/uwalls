import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uwalls/models/profile_model.dart';
import 'package:uwalls/shared/routes/routes.dart';
import 'package:uwalls/shared/routes/routes_navigator.dart';
import 'package:uwalls/shared/utils/stateid.dart';

class AuthController extends GetxController {

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  ProfileModel profile = const ProfileModel();

  String userReferences = '-';

  String userAvatar = 'https://firebasestorage.googleapis.com/v0/b/uwalls-caa87.appspot.com/o/asset%2Favatar.jpg?alt=media&token=5a85f041-6d30-4e03-834d-f6a5dfffdf2e';
  
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 500), () => 
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

  void setProfileUser({required User user}) async {
    if(userReferences == '-'){
      userReferences = 'users/${user.uid}';
    }
    await getUserDetailFirestore();
    AppNavigator.pushRemoveAll(route: AppRoutes.mainRoute);
  }

  Future<void> saveUserToFirestore({required int action, required User user}) async {
    userReferences = 'users/${user.uid}';
    Map<String, dynamic> data = <String, dynamic>{
      'id': user.uid,
      'photo': action == 10 ? userAvatar : user.photoURL,
      'name': action == 10 ? '$firstName $lastName' : user.displayName,
      'email': user.email,
      'phone': user.phoneNumber ?? '-',
    };
    await firestore.doc(userReferences).set(data);
  }

  Future<void> getUserDetailFirestore() async {
    await firestore.doc(userReferences).get().then((value) {
      if(value.exists){
        profile = ProfileModel(
          id: value.get('id'),
          photo: value.get('photo'),
          name: value.get('name'),
          email: value.get('email'),
          phone: value.get('phone'),
        );
        update();
      }
    });
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

  void loginWithGoogle() async {
    try {
      final googleAccount = await GoogleSignIn().signIn();
      final googleAuth = await googleAccount?.authentication;
      
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await auth.signInWithCredential(credential).then((value) async {
        await saveUserToFirestore(action: 20, user: value.user!);
        setProfileUser(user: value.user!);
      });
    } on FirebaseAuthException catch (e) {
      log('KESINI => ${e.code}');
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
      ).then((value) async {
        await saveUserToFirestore(action: 10, user: value.user!);
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
    await auth.signOut().then((value) => AppNavigator.pushRemoveAll(route: AppRoutes.loginRoute));
  }

}