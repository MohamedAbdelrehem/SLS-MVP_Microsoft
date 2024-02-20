import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/constants.dart';

// import 'constants.dart';
// import 'iconbar.dart';
import 'slider.dart';
import 'thermo.dart';

class ThermoViewBody extends StatelessWidget {
  final num val;

  ThermoViewBody({super.key, required this.val});

  @override
  Widget build(BuildContext context) {
      final ValueNotifier<double> temperature = ValueNotifier(val.toDouble());

    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    print('TemperatureView.build... ${size.height}');
    final style =
        size.height < 600 ? textTheme.displayMedium : textTheme.displayLarge;

    return Center(
      child: SizedBox(
        width: 400,
        child: ValueListenableBuilder(
          valueListenable: temperature,
          builder: (context, value, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    '  ${val}°',
                    style: style?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.loose(const Size(600, 400)),
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Thermo(temperature: temperature.value)),
                          Positioned.fill(
                            left: 300,
                            child: ThermoSlider(
                              value: temperature.value,
                              onValueChanged: (value) =>
                                  temperature.value = value,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // TemperatureIconBar(
                //   value: value / maxTemperature,
                //   onTemperatureChanged: (t) => temperature.value = t,
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}
