import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/features/monitoring/widgets/monitoring_view_body.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String ignite;
  final String temp;

  DetailsPage(
      {super.key,
      required this.name,
      required this.ignite,
      required this.temp});

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
        title: Text('Monitoring $name',
            style: TextStyle(
                fontSize: 20,
                color: Colors.amber,
                fontWeight: FontWeight.bold)),
      ),
      body: MonitorViewBody(
        name: name,
        vehicleID: ignite,
        temp: temp,
      ),
    );
  }
}
