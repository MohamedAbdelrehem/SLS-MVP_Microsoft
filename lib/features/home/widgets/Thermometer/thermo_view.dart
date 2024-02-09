import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/widgets/thermo.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/widgets/thermo_view_body.dart';

class ThermoView extends StatelessWidget {
  const ThermoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: CustomContainer(
        width: 500,
        height: 380,
        child: ThermoViewBody(),
      ),
    );
  }
}
