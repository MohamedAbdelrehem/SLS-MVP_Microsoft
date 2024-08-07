import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
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
  UnityWidgetController? _unityViewController;
  Timer? _sendDataTimer;

  @override
  void initState() {
    super.initState();
    _sendDataTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      sendAllData(); // Call sendAllData2 every second
    });
  }

  @override
  void dispose() {
    _sendDataTimer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
    _unityViewController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesCubit, VehiclesState>(
      builder: (context, state) {
        if (state is VehichlesGetLoading) {
          return CustomLoadingIndicator();
        } else if (state is VehiclesGetSuccess) {
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
                        onUnityCreated: (controller) =>
                            _unityViewController = controller,
                        onUnityMessage: (msg) => print(
                            "Received message from unity: ${msg.toString()}"),
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
                            test();
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
        } else {
          return Text('this is an error');
        }
      },
    );
  }

  void sendAllData() {
    final carFirebaseRealtime = BlocProvider.of<VehiclesCubit>(context)
        .carParsedrealtime[int.parse(widget.vehicleId)];

    // Convert the map to a JSON string before sending
    String jsonData = jsonEncode(carFirebaseRealtime);

    _unityViewController?.postMessage(
      'HMI',
      'UpdateCarDataFromFlutter',
      jsonData, // Send the JSON string instead of toString()
    );
  }

  void test() {
    _unityViewController?.postMessage(
      'Interaction',
      'Switch',
      '',
    );
  }

  void button1() {
    _unityViewController?.postMessage(
      'Interaction',
      'Switch',
      '',
    );
  }
}
