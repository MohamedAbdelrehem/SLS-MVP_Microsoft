import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class FuelGauge extends StatefulWidget {
  const FuelGauge({Key? key, required this.title, required this.fuel}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
final num fuel;
  final String title;

  @override
  FuelGaugeState createState() => FuelGaugeState();
}

class FuelGaugeState extends State<FuelGauge> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        axes: <RadialAxis>[
          RadialAxis(
              startAngle: 180,
              endAngle: 0,
              showTicks: false,
              showAxisLine: false,
              showLabels: false,
              canScaleToFit: true,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 0,
                    endValue: 10,
                    startWidth: 10,
                    endWidth: 12.5,
                    color: Colors.red),
                GaugeRange(
                    startValue: 12,
                    endValue: 20,
                    startWidth: 12.5,
                    endWidth: 15,
                    color: Colors.black),
                GaugeRange(
                    startValue: 22,
                    endValue: 30,
                    startWidth: 15,
                    endWidth: 17.5,
                    color: Colors.black),
                GaugeRange(
                    startValue: 32,
                    endValue: 40,
                    startWidth: 17.5,
                    endWidth: 20,
                    color: Colors.black),
                GaugeRange(
                    startValue: 42,
                    endValue: 50,
                    startWidth: 20,
                    endWidth: 22.5,
                    color: Colors.black),
                GaugeRange(
                    startValue: 52,
                    endValue: 60,
                    startWidth: 22.5,
                    endWidth: 25,
                    color: Colors.black),
                GaugeRange(
                    startValue: 62,
                    endValue: 70,
                    startWidth: 25,
                    endWidth: 27.5,
                    color: Colors.black),
                GaugeRange(
                    startValue: 72,
                    endValue: 80,
                    startWidth: 27.5,
                    endWidth: 30,
                    color: Colors.black),
                GaugeRange(
                    startValue: 82,
                    endValue: 90,
                    startWidth: 30,
                    endWidth: 32.5,
                    color: Colors.black),
                GaugeRange(
                    startValue: 92,
                    endValue: 100,
                    startWidth: 32.5,
                    endWidth: 35,
                    color: Colors.black)
              ],
              pointers:  <GaugePointer>[
                NeedlePointer(
                    value: widget.fuel.toDouble(),
                    needleEndWidth: 7,
                    // onValueChanged: onPointerValueChanged,
                    needleStartWidth: 1,
                    needleColor: Colors.red,
                    needleLength: 0.85,
                    knobStyle: KnobStyle(color: Colors.black, knobRadius: 0.09))
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Container(
                        width: 30.00,
                        height: 30.00,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage('images/fuel.jpg'),
                            fit: BoxFit.fill,
                          ),
                        )),
                    angle: 270,
                    positionFactor: 0.35),
                const GaugeAnnotation(
                    widget: Text(
                      'E',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    ),
                    angle: 175,
                    positionFactor: 1),
                const GaugeAnnotation(
                    widget: Text(
                      'F',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Times'),
                    ),
                    angle: 5,
                    positionFactor: 0.95),
              ])
        ],
      ),
    );
  }
}

//   void onPointerValueChanged(double value) {
//     setState(() {
//       if (value >= 0 && value <= 10) {
//         onFirstRangeColorChanged();
//       } else if (value >= 10 && value <= 20) {
//         onSecondRangeColorChanged();
//       } else if (value >= 20 && value <= 30) {
//         onThirdRangeColorChanged();
//       } else if (value >= 30 && value <= 40) {
//         onFourthRangeColorChanged();
//       } else if (value >= 40 && value <= 50) {
//         onFifthRangeColorChanged();
//       } else if (value >= 50 && value <= 60) {
//         onSixthRangeColorChanged();
//       } else if (value >= 60 && value <= 70) {
//         onSeventhRangeColorChanged();
//       } else if (value >= 70 && value <= 80) {
//         onEighthRangeColorChanged();
//       } else if (value >= 80 && value <= 90) {
//         onNinethRangeColorChanged();
//       } else if (value >= 90 && value <= 100) {
//         onTenthRangeColorChanged();
//       }
//     });
//   }

//   void onFirstRangeColorChanged() {
//     color1 = Colors.red;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onSecondRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.red;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onThirdRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.red;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onFourthRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.red;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onFifthRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.red;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onSixthRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.red;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onSeventhRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.red;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onEighthRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.red;
//     color9 = Colors.black;
//     color10 = Colors.black;
//   }

//   void onNinethRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.black;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.red;
//     color10 = Colors.black;
//   }

//   void onTenthRangeColorChanged() {
//     color1 = Colors.black;
//     color2 = Colors.black;
//     color3 = Colors.black;
//     color4 = Colors.red;
//     color5 = Colors.black;
//     color6 = Colors.black;
//     color7 = Colors.black;
//     color8 = Colors.black;
//     color9 = Colors.black;
//     color10 = Colors.red;
//   }

//   Color color1 = Colors.red;
//   Color color2 = Colors.black;
//   Color color3 = Colors.black;
//   Color color4 = Colors.black;
//   Color color5 = Colors.black;
//   Color color6 = Colors.black;
//   Color color7 = Colors.black;
//   Color color8 = Colors.black;
//   Color color9 = Colors.black;
//   Color color10 = Colors.black;
// }
