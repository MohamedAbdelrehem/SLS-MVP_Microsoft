import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';

class MapLeafletViewVehicle extends StatefulWidget {
  const MapLeafletViewVehicle({super.key, required this.index});
  final int index;
  @override
  _MapLeafletViewVehicleState createState() => _MapLeafletViewVehicleState();
}

class _MapLeafletViewVehicleState extends State<MapLeafletViewVehicle> {
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData currentLocation = await location.getLocation();
    setState(() {
      _currentLocation = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesCubit, VehiclesState>(
      builder: (context, state) {
        if (state is VehichlesGetLoading) {
          return CustomLoadingIndicator();
        } else if (state is VehiclesGetFailure) {
          return Text('failure getting vehicle data ');
        } else if (state is VehiclesGetSuccess) {
          Map<String, dynamic> car = BlocProvider.of<VehiclesCubit>(context)
              .carParsedrealtime[widget.index];

          if (car['location']['latitude'] == 'INVALID' ||
              car['location']['latitude'] == 'null') {
            return Column(
              children: [
                Expanded(
                    child: Icon(
                  Icons.dangerous,
                  color: Colors.red,
                  size: 50,
                )),
                Expanded(
                    child: Text(
                  'INVALID location',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                )),
              ],
            );
          } else {
            final num loclat = num.parse(car['location']['latitude']);
            final double lat = loclat.toDouble();
            final num loclong = num.parse(car['location']['longitude']);
            final double long = loclong.toDouble();

            return FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(lat, long),
                initialZoom: 9.2,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(lat, long),
                      child: Container(
                        child: const Icon(
                          Icons.local_shipping_rounded,
                          size: 30.0,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        } else if (state is VehiclesInitial) {
          return Text('this is the intial state');
        } else {
          return Text('state management problem');
        }
      },
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:location/location.dart';

// class MapLeafletViewVehicle extends StatefulWidget {
//   const MapLeafletViewVehicle({super.key});

//   @override
//   _MapLeafletViewVehicleState createState() => _MapLeafletViewVehicleState();
// }

// class _MapLeafletViewVehicleState extends State<MapLeafletViewVehicle> {
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

//     LocationData currentLocation = await location.getLocation();
//     setState(() {
//       _currentLocation = currentLocation;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//       options: MapOptions(
//         center: _currentLocation != null
//             ? LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!)
//             : const LatLng(51.509364, -0.128928),
//         zoom: 9.2,
//       ),
//       children: [
//         TileLayer(
//           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//           userAgentPackageName: 'com.example.app',
//         ),
//         MarkerLayer(
//           markers: [
//             Marker(
//               width: 80.0,
//               height: 80.0,
//               point: _currentLocation != null
//                   ? LatLng(
//                       _currentLocation!.latitude!, _currentLocation!.longitude!)
//                   : const LatLng(51.509364, -0.128928),
//               child: Container(
//                 child: const Icon(
//                   Icons.location_on,
//                   size: 45.0,
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
