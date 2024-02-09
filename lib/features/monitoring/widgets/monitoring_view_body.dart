import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Map/mapLeaflet_view.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/thermo_view.dart';

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
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
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

              Padding(
                padding: const EdgeInsets.all(30),
                child: CustomContainer(
                  width: 500,
                  height: 380,
                  child: MapLeafletView(),
                ),
              ),
              ThermoView(),
            ],
          ),
        ),
      ),
    );
  }
}
