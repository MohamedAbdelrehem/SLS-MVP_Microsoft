import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  FetchUsersCubit() : super(FetchUsersInitial());

 late Map<String,dynamic> userdata ={}; 

  Future<void> getCurrentUser()async{
    emit(FetchUsersLoading());
    try {
  final currentuser = FirebaseAuth.instance.currentUser;
  if(currentuser !=null){
        final firestore = FirebaseFirestore.instance;
  final userid = currentuser.uid;
  final docsnapshot = await firestore.collection("users").doc(userid).get();
   userdata = docsnapshot.data()!;
   emit(FetchUsersSuccess());
  }else{
        print('you are signed out you cant get current user ');

      emit(FetchUsersFailure());
  }
}  catch (e) {
  print('error');
  print(e);
  emit(FetchUsersFailure());
}

  }




    


  }

