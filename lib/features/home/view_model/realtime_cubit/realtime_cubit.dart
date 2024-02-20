import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'realtime_state.dart';

class RealtimeCubit extends Cubit<RealtimeState> {
  RealtimeCubit() : super(RealtimeInitial());

  final database = FirebaseDatabase.instance.ref().child('cars');
  late String carRaw ;
    late Map<String,dynamic> carParsed={};
  void loadCarData() async {
    emit(RealtimeLoadiang());

    try {
      print('entered');
      final event = await database.once(DatabaseEventType.value);
            print('2');
// print(event.snapshot.value);
        carRaw  =  json.encode(event.snapshot.value);
        carParsed = json.decode(carRaw);
      print(carParsed);
      emit(RealtimeSuccess());
    } catch (e) {
   print('error1');

      emit(RealtimeFailure());
    }

    try {
      database.onValue.listen((event) {
              print('entered2');
              print(event.snapshot.value);
         carRaw  =  json.encode(event.snapshot.value);
        carParsed = json.decode(carRaw);
// final childKey = event.snapshot.key;
// print(childKey);

//         carParsed ={childKey!:event.snapshot.value}; 
        print(carParsed);    
        
         print('leaved3');

        emit(RealtimeSuccess());
      });
    } catch (e) {
                    print('error2');

      emit(RealtimeFailure());
    }
    // final event = await database.child('car').once(DatabaseEventType.value);
    // temparture = event.snapshot.value?['temp'];
  }
}
