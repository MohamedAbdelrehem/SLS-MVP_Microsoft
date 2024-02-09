import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/widgets/thermo.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/widgets/thermo_view_body.dart';

class ThermoView extends StatelessWidget {
  const ThermoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ThermoViewBody(),
    );
  }
}
