import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meta/meta.dart';
import 'package:sls_mvp_microsoft/features/home/data/services/firebase_services.dart';
part 'vehicles_state.dart';

class VehiclesCubit extends Cubit<VehiclesState> {
  VehiclesCubit() : super(VehiclesInitial());

  Future<void> addVehicle (
     {required String vehicleid,
      required String vehicletype,
      required String vehichlemodel,
      required String vehiclecolor,
      required String vehiclefueltype,
      required num vehiclefuelcapciaty,
       required String vehiclemodel3durlpath}
  )async{


    // // Handle platform-specific paths
    // final absolutePath = Platform.isAndroid
    //     ? vehiclemodel3durlpath.path
    //     : File(vehiclemodel3durlpath.path).absolutePath;
    emit(VehiclesAddLoading());
try {

  await FirebaseFirestoreServiceVehicles().addVehicle(vehicleid:vehicleid ,vehicletype: vehicletype,vehiclecolor: vehiclecolor,vehichlemodel:vehichlemodel,vehiclefuelcapciaty: vehiclefuelcapciaty,vehiclefueltype: vehiclefueltype,vehiclemodel3durlpath: vehiclemodel3durlpath);
emit(VehiclesAddSuccess());
}catch (e) { 
emit(VehiclesAddFailure());
}
  
  }


    late List<Map<String,dynamic>> carParsed = [];
        late List<Map<String,dynamic>> carParsedrealtime=[];

  Future<void> getVehicle () async{

   
print('entered gettijg');

    emit(VehichlesGetLoading());
try {

  print('entered try getting');
final QuerySnapshot querySnapshot= await FirebaseFirestore.instance
    .collection('vehicles') 
    .get();
      print('enterere for loop');
      print('this car parsed before even starting $carParsed');
      carParsed.clear();
        for (var doc in querySnapshot.docs) {

          print('elements');
          String test = json.encode(doc.data());
          Map<String,dynamic> decoded = json.decode(test);
          print(doc.id);
          decoded['id']=doc.id;
          print(doc.data());
          print(decoded['id']);
          print(decoded);
         carParsed.add(decoded);
         print('this is car parsed car pasrsed car parsed$carParsed');
print('element added');
        }
        print('outside loop after car parsed ended $carParsed');

 

print('outisdfffffffffffffffffffffffffff');

        print('car parsedddddddddddddddddddddddddddddddddddddddddddddddddddd');

emit(VehiclesGetSuccess());
}catch (e) { 
emit(VehiclesGetFailure());
return;
}




  }

  
Future<void> getVehiclerealtime () async{

  emit(VehichlesGetLoading());
                final database =   FirebaseDatabase.instance.ref('/car');


  try{
print('enter realtime data before looping');
      database.onChildChanged.listen((event) {
        
        print('refactoring test');
        print(event.snapshot.key);
//         print('realtime data');
//         carParsedrealtime.clear();
//         print('cleared');

//         print(event.snapshot.value.toString());
//         print('refactoring twice');
// print(json.encode(event.snapshot.value));
// print(json.decode(json.encode(event.snapshot.value)).toString());
// for (var childsnapshot in event.snapshot.children) {
//   print('looping realitme');
//   String tettes =  json.encode(childsnapshot.value);
//   Map<String,dynamic> decodedrealtime = json.decode(tettes);
//   print(decodedrealtime);
//   carParsedrealtime.add(decodedrealtime);
//   print(carParsedrealtime);

// }

//   print('this is the list the refactoring${carParsedrealtime}');


//         print(carParsedrealtime);    
        
//          print('leaved3');
//                print('emiting new state agaon00');
  emit(VehiclesGetSuccess());


      });


}catch(e){
emit(VehiclesGetFailure());

}
}

  @override
  void onChange(Change<VehiclesState> change) {
    super.onChange(change);
print('this is the change dd $change');
  }
}
