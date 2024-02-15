import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';
// import 'package:sls_mvp_microsoft/features/authentication/data/services/firebase_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser(String email, String password) async {
    emit(RegisterLoading());
    try {
      // FirebaseAuthService().signupWithEmailAndPassword(email, password);
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure());
    }
  }

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    try {
      // FirebaseAuthService().signinWithEmailAndPassword(email, password);
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
