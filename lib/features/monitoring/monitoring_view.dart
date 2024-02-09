import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/features/monitoring/widgets/monitoring_view_body.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String age;
  final String occupation;

  DetailsPage(
      {required this.name, required this.age, required this.occupation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //back button
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).go('/home');
          },
        ),
        title: Text('Details'),
      ),
      body: MonitorViewBody(
        name: name,
        age: age,
        occupation: occupation,
      ),
    );
  }
}
