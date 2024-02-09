import 'package:flutter/material.dart';

class MonitorViewBody extends StatelessWidget {
  final String name;
  final String ignite;
  final String temp;

  const MonitorViewBody({
    Key? key,
    required this.name,
    required this.ignite,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int col = int.parse(ignite);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: $name'),
          Icon(
            Icons.power_settings_new,
            color: Color(col),
          ),
          Text('Occupation: $temp'),
          // Add more details as needed
        ],
      ),
    );
  }
}
