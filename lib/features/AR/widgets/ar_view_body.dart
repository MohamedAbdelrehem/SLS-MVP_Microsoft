import 'package:flutter/material.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:sls_mvp_microsoft/constants.dart';

class ARViewBody extends StatefulWidget {
  const ARViewBody({Key? key}) : super(key: key);

  @override
  State<ARViewBody> createState() => _ARViewBodyState();
}

class _ARViewBodyState extends State<ARViewBody> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: () async {
            // Pop the category page if Android back button is pressed.
            return true;
          },
          child: Container(
            color: kWhiteColor,
            child: UnityWidget(
              onUnityCreated: onUnityCreated,
            ),
          ),
        ),
      ),
    );
  }

  // Callback that connects the created controller to the unity controller
  void onUnityCreated(controller) {}
}
