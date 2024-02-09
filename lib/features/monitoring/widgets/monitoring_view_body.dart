import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Map/mapLeaflet_view.dart';
import 'package:sls_mvp_microsoft/features/home/widgets/Thermometer/thermo_view.dart';
import 'package:sls_mvp_microsoft/features/monitoring/widgets/fuel_gauge.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text('Name: $name'),
                // Icon(
                //   Icons.power_settings_new,
                //   color: Color(col),
                // ),
                // Text('temparture: $temp'),
                // const SizedBox(
                //   height: 20,
                // ),
                CustomContainer(
                  width: 500,
                  height: 380,
                  child: const ModelViewer(
                    backgroundColor: Colors.white,
                    src: 'assets/car.glb',
                    alt: '3d car model',
                    ar: true,
                    autoRotate: true,
                    disableZoom: true,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        width: 350,
                        height: 250,
                        child: SpeedGauge(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomContainer(
                        width: 350,
                        height: 250,
                        child: RpmGauge(),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                  child: CustomContainer(
                    width: 500,
                    height: 380,
                    child: MapLeafletView(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomContainer(
                    width: 200,
                    height: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          color: Color(0xFFD12E23),
                          size: 100,
                        ),
                        Icon(
                          Icons.warning,
                          color: Color(0xFFF5DE0E),
                          size: 40,
                        )
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                const CustomContainer(
                    width: 340,
                    height: 380,
                    child: FuelGauge(title: 'fuel gauge')),
                const SizedBox(
                  height: 20,
                ),
                const ThermoView(),
                const SizedBox(
                  height: 20,
                ),
                CustomContainer(
                    width: 350,
                    height: 380,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.power_settings_new,
                                    color: Color(col),
                                    size: 120,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 229, 229, 229),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      'Ignition',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 60, 60, 60)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(
                            //   width: 20,
                            // ),
                            Expanded(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Image.asset(
                                    'assets/images/steering.png',
                                    width: 120,
                                    height: 120,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 229, 229, 229),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      '50 degrees',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 60, 60, 60)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/brake1.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: const Text(
                                        'on',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/fet.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: const Text(
                                        'R',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RpmGauge extends StatelessWidget {
  const RpmGauge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 8, ranges: <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 6, color: Colors.green),
        GaugeRange(startValue: 6, endValue: 8, color: Colors.red),
      ], pointers: const <GaugePointer>[
        NeedlePointer(value: 2)
      ], annotations: const <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Text('2.0',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}

class SpeedGauge extends StatelessWidget {
  const SpeedGauge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(enableLoadingAnimation: true, axes: <RadialAxis>[
      RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
        GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
        GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
        GaugeRange(startValue: 100, endValue: 150, color: Colors.red)
      ], pointers: const <GaugePointer>[
        NeedlePointer(value: 90)
      ], annotations: const <GaugeAnnotation>[
        GaugeAnnotation(
            widget: Text('90.0',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            angle: 90,
            positionFactor: 0.5)
      ])
    ]);
  }
}
