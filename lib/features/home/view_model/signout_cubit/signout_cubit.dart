import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'signout_state.dart';

class SignoutCubit extends Cubit<SignoutState> {
  SignoutCubit() : super(SignoutInitial());

  Future<void> signout() async {
    emit(SignoutLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(SignoutSuccess());
    } catch (e) {
      emit(SignoutFailure());
    }
  }
}
  // Future<void> userSignOut() async {
  //   await auth.signOut();
  // }