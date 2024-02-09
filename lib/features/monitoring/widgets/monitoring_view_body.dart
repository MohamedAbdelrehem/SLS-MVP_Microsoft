import 'package:flutter/material.dart';

class MonitorViewBody extends StatelessWidget {
  final String name;
  final String age;
  final String occupation;

  const MonitorViewBody({
    Key? key,
    required this.name,
    required this.age,
    required this.occupation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: $name'),
          Text('Age: $age'),
          Text('Occupation: $occupation'),
          // Add more details as needed
        ],
      ),
    );
  }
}
