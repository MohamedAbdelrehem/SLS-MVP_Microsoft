import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';

import 'package:sls_mvp_microsoft/features/home/view/widgets/Map/mapLeaflet_view.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/totalVehicles_view.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/car_realtime_cubit/car_realtime_cubit.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/realtime_cubit/realtime_cubit.dart';
// import 'package:sls_mvp_microsoft/features/home/widgets/Map/mapbox_view.dart';
// import 'package:sls_mvp_microsoft/features/monitoring/monitoring_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: CustomContainer(
            width: 500,
            height: 350,
            child: TotalVehiclesPieChart(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.all(30),
          child: CustomContainer(
            width: 500,
            height: 380,
            child: MapLeafletView(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: CustomContainer(
            width: 500,
            height: 380,
            child: tableV(context: context),
          ),
        ),
      ],
    ));
  }
}

class tableV extends StatelessWidget {
  const tableV({
    super.key,
    required this.context,
  });

  final BuildContext context;
  void _navigateToDetailsPage(String name, String ignite, String temp) {
    context.goNamed('DetailsPage',
        pathParameters: {'name': name, 'ignite': ignite, 'temp': temp});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealtimeCubit, RealtimeState>(
      builder: (context, state) {
        if (state is RealtimeInitial) {
          BlocProvider.of<RealtimeCubit>(context).loadCarData();
        } else if (state is RealtimeLoadiang) {
          return const CircularProgressIndicator();
        } else if (state is RealtimeSuccess) {
          Map<String,dynamic> car = BlocProvider.of<RealtimeCubit>(context).carParsed;
           Color mcolor = Colors.grey;
            Color dcolor = Colors.grey;

if (car['ignition'] != null ) {
  mcolor= car['ignition'] ? Colors.green : Colors.red;
} else {
  // Set a default color or handle the null case here
  Color mcolor = Colors.grey; // Example default color
}
if (car['door'] != null ) {
  dcolor= car['door'] ? Colors.green : Colors.red;
} else {
  // Set a default color or handle the null case here
  Color dcolor = Colors.grey; // Example default color
}
  
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'VEHICLE',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'IGNITION',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'CABINET1',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'DOOR',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'KMS TODAY',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'ALERTS',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'LOCATION',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'SPEED',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'TRIPS',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'TOTAL KMS',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'LAST UPDATE',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'GROUP',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'DRIVER',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'FIRST ACTIVE',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'LAST ACTIVE',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'TIMESTAMP',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'VIDEO',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'BATTERY',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(
                      const Row(
                        children: [
                          Icon(Icons.local_shipping),
                          SizedBox(
                            width: 10,
                          ),
                          Text('M854269'),
                        ],
                      ),
                      onTap: () {
                        _navigateToDetailsPage('M854269', '0xFF008000', '10°c');
                      },
                    ),
                     DataCell(Icon(Icons.power_settings_new,
                        color:mcolor,)),
                    DataCell(Text('${car['temp']}°C')),
                     DataCell(
                        Icon(Icons.door_front_door, color: dcolor)),
                    const DataCell(Text('191 KMs')),
                    const DataCell(
                        Text('104', style: TextStyle(color: Colors.red))),
                    const DataCell(Text('28,AI turath street',
                        style: TextStyle(color: Colors.blue))),
                     DataCell(Text('${car['speed']} Kmph')),
                    DataCell(Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text('0',
                            style: TextStyle(color: Colors.white)))),
                    DataCell(Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: const Text('0 0 0 2 8 2 7 4',
                            style: TextStyle(color: Colors.black)))),
                    const DataCell(Text('50 sec ago')),
                    const DataCell(Text('Merchandiser')),
                    const DataCell(Text('Najeeb Mohammed')),
                    const DataCell(Text('08:07 AM')),
                    const DataCell(Text('04:00 PM')),
                     DataCell(Text(car['timestamp'])),
                    const DataCell(Icon(Icons.videocam, color: Colors.red)),
                     DataCell(Text('${car['battery']}volts')),
                  ],
                ),
                // DataRow(
                //   cells: <DataCell>[
                //     DataCell(
                //       Text('Ahmed'),
                //       onTap: () {
                //         _navigateToDetailsPage('Ahmed', '19', 'Student');
                //       },
                //     ),
                //     DataCell(Text('19')),
                //     DataCell(Text('Student')),
                //     DataCell(Text('Student')),
                //     DataCell(Text('Student')),
                //     DataCell(Text('Student')),
                //     DataCell(Text('Student')),
                //     DataCell(Text('Student')),
                //   ],
                // ),
              ],
            ),
          );
        } else {
          return const Text('VERY BIG ERROR');
        }
        return const Text('');
      },
    );
  }
}