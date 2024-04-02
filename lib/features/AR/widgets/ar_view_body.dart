import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';

class ARViewBody extends StatefulWidget {
  const ARViewBody({Key? key, required this.vehicleId}) : super(key: key);
  final String vehicleId;

  @override
  State<ARViewBody> createState() => _ARViewBodyState();
}

class _ARViewBodyState extends State<ARViewBody> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();
  UnityWidgetController? _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> carFirebaseRealtime =
        BlocProvider.of<VehiclesCubit>(context)
            .carParsedrealtime[int.parse(widget.vehicleId)];

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            // Pop the category page if Android back button is pressed.
            return true;
          },
          child: Stack(
            children: [
              Container(
                color: kWhiteColor,
                child: UnityWidget(
                  onUnityCreated: onUnityCreated,
                  onUnityMessage: (msg) =>
                      print("Received message from unity: ${msg.toString()}"),
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: Container(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                          "speed is" + carFirebaseRealtime['speed'].toString());
                    },
                    child: Text('Button'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {
    _unityWidgetController = controller;
  }
}
