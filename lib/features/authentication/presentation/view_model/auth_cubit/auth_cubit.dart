import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';
// import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';
// import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser(
      {required String firstname,
      required String lastname,
      required String email,
      required String role,
      required String managercode,
      required String password}) async {
    emit(RegisterLoading());
    try {
      // await FirebaseAuthService().signupWithEmailAndPassword(email, password);
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Registration error: $e');
      emit(RegisterFailure());
      return;
    }
    try {
      FirebaseFirestoreService().addUser(
        firstname: firstname,
        lastname: lastname,
        email: email,
        role: role,
        managercode: managercode,
      );
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure());
    }
  }

  Future<void> loginUser(String email, String password) async {
    // print('before loading');

    emit(LoginLoading());
    // print('after loading');

    try {
      // print('before firebase');

      // await FirebaseAuthService().signinWithEmailAndPassword(email, password);
      // print('after firebase');

      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }

  // Future<void> signout(String email, String password) async {
  //   emit(LoginLoading());
  //   try {
  //     FirebaseAuthService().signinWithEmailAndPassword(email, password);
  //   } catch (e) {
  //     emit(LoginFailure());
  //   }
  // }
}
