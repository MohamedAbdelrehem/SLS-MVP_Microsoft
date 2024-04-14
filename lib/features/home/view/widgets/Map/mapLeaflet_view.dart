import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';

class MapLeafletView extends StatefulWidget {
  const MapLeafletView({super.key});

  @override
  _MapLeafletViewState createState() => _MapLeafletViewState();
}

class _MapLeafletViewState extends State<MapLeafletView> {
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
    print('this is current locatioon in initstate $currentLocation');
    setState(() {
      _currentLocation = currentLocation;
    });
    // return currentLocation;
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
          List<Map<String, dynamic>> car =
              BlocProvider.of<VehiclesCubit>(context).carParsedrealtime;

          // var imp = car.toString();

          return FutureBuilder(
              future: Future.value(_currentLocation),
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  LocationData? loc = snapshot.data;

                  return FlutterMap(
                    options: MapOptions(
                      initialCenter:
                          LatLng(loc!.latitude!, loc!.longitude!), //29,31
                      initialZoom: 9.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(markers: [
                        Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(_currentLocation?.latitude ?? 0,
                              _currentLocation?.longitude ?? 0),
                          child: const Icon(
                            Icons.man_outlined,
                            size: 30.0,
                            color: Colors.blue,
                          ),
                        ),
                        ...car.map((carData) {
                          if (carData['location']['longitude'] == 'INVALID' ||
                              carData['location']['longitude'] == 'null') {
                            return Marker(
                              width: 0.0,
                              height: 0.0,
                              point: LatLng(0, 0),
                              child: Container(),
                            );
                          } else {
                            final num testing = num.parse(
                                carData['location']['latitude'].toString());
                            final double lat = testing.toDouble();

                            final num testing2 = num.parse(
                                carData['location']['longitude'].toString());
                            final double long = testing2.toDouble();
                            return Marker(
                              width: 80.0,
                              height: 80.0,
                              point: LatLng(
                                lat, // Extract latitude
                                long, // Extract longitude
                              ),
                              child: Tooltip(
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.fire_truck_rounded,
                                    size: 25.0,
                                    color: kPrimaryColor,
                                  ),
                                  textStyle: TextStyle(
                                      color: kSecondColor, fontSize: 15),
                                  message:
                                      'Battery: ${carData['battery']}% \nFuel: ${carData['fuel']}% \nSpeed: ${carData['speed']} km/h'),
                            );
                          }
                        }).toList()
                      ]),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CustomLoadingIndicator();
                }
              }));
        } else if (state is VehiclesInitial) {
          return Text('this is the intial state');
        } else {
          return Text('state management problem');
        }
      },
    );
  }
}
