import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class FirebaseFirestoreServiceVehicles {
  CollectionReference vehicles =
      FirebaseFirestore.instance.collection('vehicles');

  Future<void> addVehicle(
      {required String vehicleid,
      required String vehicletype,
      required String vehichlemodel,
      required String vehiclecolor,
      required String vehiclefueltype,
      required num vehiclefuelcapciaty,
      required String vehiclemodel3durlpath}) {
    //! check if vehicle already exists in realtime database
    /*
      if code readed from text box is in realtime database then 
        if password read from text box is equal to password in realtime database then
          add vehicle to firestore (code blow)
          add vehicle code to firestore in user (Manger) as vehicle collection  
        else
          show error message
     */

    final vehicleRef = vehicles.doc(vehicleid);

    return vehicleRef.set({
      'vehicle_type': vehicletype,
      'vehicle_model': vehichlemodel,
      'vehicle_color': vehiclecolor,
      'vehicle_fuel_type': vehiclefueltype,
      'vehicle_fuel_capacity': vehiclefuelcapciaty,
      // 'model3d_url': vehiclemodel3durl
    }).then((value) async {
      print("Vehicle Added");
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference storageReference =
          storage.ref().child('vehicle_models_3d/$vehicleid.glb');
// print(storageReference);
// print(vehiclemodel3durlpath);
// Directory appDocDir = await getApplicationDocumentsDirectory();
// String appDocPath = appDocDir.path;
// Directory appdoc = appDocDir.absolute;
// print ( appDocDir);
// print(appDocPath);
// print(appdoc);
// String filePath = '${appDocDir.path}/$vehiclemodel3durlpath';
// File file = File(filePath);

      if (!await File(vehiclemodel3durlpath).exists()) {
        print("it doesn't exist");
        throw Exception('The specified file does not exist.');
      } else {
        UploadTask uploadTask =
            storageReference.putFile(File(vehiclemodel3durlpath));
        print(uploadTask);
        await uploadTask.whenComplete(() async {
          String downloadUrl = await storageReference.getDownloadURL();

          await vehicles
              .doc(vehicleid)
              .update({'vehicle_3d_model_url': downloadUrl});
        });
      }

      //! don't add vehicle to realtime database
      final database = FirebaseDatabase.instance.ref('/car');
      final userRef = database.child(vehicleid);
      await userRef.set({
        "battery": 40,
        "door": true,
        "fatis": "R",
        "fuel": 20,
        "ignition": false,
        "manualbrake": true,
        "rpm": 4.8,
        "sleep": false,
        "speed": 30.5,
        "steering": 30,
        "temp": 0,
        "timestamp": "02/01/2024 16:22"
      });
    }).catchError((error) => print("Failed to add Vehicle: $error"));
  }
}
