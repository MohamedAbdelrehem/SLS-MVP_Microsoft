// import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
// import 'package:location/location.dart';
// import 'package:sls_mvp_microsoft/constants.dart';

// class MapboxView extends StatefulWidget {
//   @override
//   _MapboxViewState createState() => _MapboxViewState();
// }

// class _MapboxViewState extends State<MapboxView> {
//   MapboxMapController? _mapController;
//   LocationData? _currentLocation;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     Location location = Location();
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;

//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     _currentLocation = await location.getLocation();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Map View'),
//       ),
//       body: _currentLocation != null
//           ? MapboxMap(
//               onMapCreated: (MapboxMapController controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(
//                     _currentLocation!.latitude!, _currentLocation!.longitude!),
//                 zoom: 14,
//               ),
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }
