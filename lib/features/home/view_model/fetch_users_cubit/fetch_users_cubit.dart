import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'fetch_users_state.dart';

class FetchUsersCubit extends Cubit<FetchUsersState> {
  FetchUsersCubit() : super(FetchUsersInitial());

 late Map<String,dynamic> userdata ={}; 

  Future<void> getCurrentUserData()async{
    emit(FetchUsersLoading());
    try {
          // CollectionReference users = FirebaseFirestore.instance.collection('users');

  final currentuser = FirebaseAuth.instance.currentUser;
  print('this is current user $currentuser');
  if(currentuser !=null){
    print('its not null');
  final userid = currentuser.uid;
  final DocumentSnapshot documentSnapshot= await FirebaseFirestore.instance
    .collection('users').doc(userid)
    .get();
      // print('enterere for loop');
      // print('this car parsed before even starting $carParsed');
      // // carParsed.clear();
  print('this is user id $userid');
  print(documentSnapshot);
    print(documentSnapshot.data());

  // print(  users.doc(userid));
  // final docsnapshot =  await users.doc(userid).get();
  // print(docsnapshot);
   userdata = json.decode(json.encode(documentSnapshot.data()));
   print(userdata);
   emit(FetchUsersSuccess());
  }else{
        print('you are signed out you cant get current user ');

      emit(FetchUsersFailure());
  }
}  catch (e) {
  print('error got some error from fetching');
  print(e);
  emit(FetchUsersFailure());
}

  }




    


  }

