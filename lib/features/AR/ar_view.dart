import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart'; // Add this import
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/features/AR/widgets/ar_view_body.dart';
import 'package:sls_mvp_microsoft/features/monitoring/widgets/monitoring_view_body.dart';

class ARPage extends StatefulWidget {
  final String vehicleId;

  ARPage({Key? key, required this.vehicleId}) : super(key: key);

  @override
  _ARPageState createState() => _ARPageState(vehicleId);
}

class _ARPageState extends State<ARPage> {
  _ARPageState(this.vehicleId);
  final String vehicleId;
  bool _hasCameraPermission = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      setState(() {
        _hasCameraPermission = true;
      });
    } else {
      status = await Permission.camera.request();
      if (status.isGranted) {
        setState(() {
          _hasCameraPermission = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // GoRouter.of(context).go('/home');
            context.pop();
          },
        ),
        title: Text(vehicleId,
            style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
      body: _hasCameraPermission
          ? ARViewBody(
              vehicleId: vehicleId,
            )
          : Center(
              child: Text(
                'Camera permission is required for AR features.',
                style: TextStyle(fontSize: 18),
              ),
            ),
    );
  }
}
