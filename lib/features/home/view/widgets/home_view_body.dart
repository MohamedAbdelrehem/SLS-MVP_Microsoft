import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_snack_bar.dart';

import 'package:sls_mvp_microsoft/features/home/view/widgets/Map/mapLeaflet_view.dart';
import 'package:sls_mvp_microsoft/features/home/view/widgets/neumorphic_expenses/totalVehicles_view.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/fetch_users_cubit/fetch_users_cubit.dart';
// import 'package:sls_mvp_microsoft/features/home/view_model/car_realtime_cubit/car_realtime_cubit.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';
// import 'package:sls_mvp_microsoft/features/home/widgets/Map/mapbox_view.dart';
import 'package:sls_mvp_microsoft/features/monitoring/monitoring_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init state again adssdsddsfgsdfsd');
    BlocProvider.of<FetchUsersCubit>(context).getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchUsersCubit, FetchUsersState>(
      builder: (context, state) {
        if (state is FetchUsersLoading) {
          return const CustomLoadingIndicator();
        } else if (state is FetchUsersFailure) {
          return const Text('error fetching user so cant display');
        } else if (state is FetchUsersSuccess) {
          Map<String, dynamic> userdata =
              BlocProvider.of<FetchUsersCubit>(context).userdata;
          if (userdata['role'] == 'Manager' || userdata['role']== 'Operator') {
            BlocProvider.of<VehiclesCubit>(context).getVehicle();
            BlocProvider.of<VehiclesCubit>(context).getVehiclerealtime();
            return SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),
                CustomContainer(
                  width: 500,
                  height: 350,
                  child: TotalVehiclesPieChart(),
                ),
                CustomContainer(
                  width: 500,
                  height: 380,
                  child: MapLeafletView(),
                ),
                Builder(builder: (context){
if(userdata['role']=='Manager'){
return Row(children: [
                  TextButton(onPressed: () {}, child: const Text('Drivers')),
                TextButton(onPressed: () {}, child:const Text('Operators')),
],);
}else if(userdata['role']=='Operator'){
  return  TextButton(onPressed: () {}, child: Text('Drivers'));
}else{
  return const Text('problem in builder');
}
                }),


                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryColor),
                              onPressed: () {
                                GoRouter.of(context).push('/cars');
                              },
                              child:
                                  const Icon(Icons.add, color: Colors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor),
                                onPressed: () {
                                  BlocProvider.of<VehiclesCubit>(context)
                                      .getVehicle();
                                  BlocProvider.of<VehiclesCubit>(context)
                                      .getVehiclerealtime();
                                },
                                child:
                                    Icon(Icons.refresh, color: Colors.white))),
                      ),
                    ],
                  ),
                ),
                CustomContainer(
                  width: 500,
                  height: 380,
                  child: tableV(),
                ),
              ],
            ));
          // } else if (userdata['role'] == 'Operator') {
          //   BlocProvider.of<VehiclesCubit>(context).getVehicle();
          //   BlocProvider.of<VehiclesCubit>(context).getVehiclerealtime();
          //   return SingleChildScrollView(
          //       child: Column(
          //     children: [
          //       SizedBox(
          //         height: 90,
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.all(20),
          //         child: CustomContainer(
          //           width: 500,
          //           height: 350,
          //           child: TotalVehiclesPieChart(),
          //         ),
          //       ),
          //       const Padding(
          //         padding: EdgeInsets.all(30),
          //         child: CustomContainer(
          //           width: 500,
          //           height: 380,
          //           child: MapLeafletView(),
          //         ),
          //       ),
          //       TextButton(onPressed: () {}, child: Text('Drivers')),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 15, right: 15),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(5),
          //               child: Align(
          //                 alignment: Alignment.centerLeft,
          //                 child: ElevatedButton(
          //                     style: ElevatedButton.styleFrom(
          //                         backgroundColor: kPrimaryColor),
          //                     onPressed: () {
          //                       GoRouter.of(context).push('/cars');
          //                     },
          //                     child:
          //                         const Icon(Icons.add, color: Colors.white)),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(5),
          //               child: Align(
          //                   alignment: Alignment.centerLeft,
          //                   child: ElevatedButton(
          //                       style: ElevatedButton.styleFrom(
          //                           backgroundColor: kPrimaryColor),
          //                       onPressed: () {
          //                         BlocProvider.of<VehiclesCubit>(context)
          //                             .getVehicle();
          //                         BlocProvider.of<VehiclesCubit>(context)
          //                             .getVehiclerealtime();
          //                       },
          //                       child:
          //                           Icon(Icons.refresh, color: Colors.white))),
          //             ),
          //           ],
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(
          //             left: 15, right: 15, bottom: 20, top: 5),
          //         child: CustomContainer(
          //           width: 500,
          //           height: 380,
          //           child: tableV(),
          //         ),
          //       ),
          //     ],
          //   ));
          } else if (userdata['role'] == 'Driver') {
            return Container();
          }
        } else if (state is FetchUsersInitial) {
          return const Column(
            children: [
              Text('this is initial state '),
              CustomLoadingIndicator()
            ],
          );
        } else {
          return const Text('state management problem');
        }
        return Text('another statenamanegment problem');
      },
    );
  }
}

class tableV extends StatelessWidget {
  const tableV({super.key});

  @override
  Widget build(BuildContext context) {
    void _navigateToDetailsPage(String name, String ignite, String temp) {
      context.pushNamed('DetailsPage',
          pathParameters: {'name': name, 'ignite': ignite, 'temp': temp});
    }

    // List vehicles=[] ;
    return BlocBuilder<VehiclesCubit, VehiclesState>(
      builder: (context, state) {
        if (state is VehichlesGetLoading) {
          print('entered loading state of GETTING');

          return const CustomLoadingIndicator();
        } else if (state is VehiclesGetSuccess) {
          List<Map<String, dynamic>> vehicle =
              BlocProvider.of<VehiclesCubit>(context).carParsed;
          List<Map<String, dynamic>> car =
              BlocProvider.of<VehiclesCubit>(context).carParsedrealtime;
          var imp = car.toString();
          var t = vehicle.toString();

          print('this is very important test $imp');
          print('this is very important test2 $t');

          Color mcolor = Colors.grey;
          Color dcolor = Colors.grey;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        "vehicleID",
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
                rows: List<DataRow>.generate(car.length, (index) {
                  if (car[index]['ignition'] != null) {
                    mcolor = car[index]['ignition'] ? Colors.green : Colors.red;
                  } else {
                    // Set a default color or handle the null case here
                    Color mcolor = Colors.grey; // Example default color
                  }
                  if (car[index]['door'] != null) {
                    dcolor = car[index]['door'] ? Colors.green : Colors.red;
                  } else {
                    // Set a default color or handle the null case here
                    Color dcolor = Colors.grey; // Example default color
                  }
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Row(
                          children: [
                            Icon(Icons.local_shipping),
                            SizedBox(
                              width: 10,
                            ),
                            Text(vehicle[index]['id']),
                            Text(index.toString()),
                          ],
                        ),
                        onTap: () {
                          _navigateToDetailsPage(
                              vehicle[index]['id'], index.toString(), '10°c');
                        },
                      ),
                      DataCell(Icon(
                        Icons.power_settings_new,
                        color: mcolor,
                      )),
                      DataCell(Text('${car[index]['temp']}°C')),
                      DataCell(Icon(Icons.door_front_door, color: dcolor)),
                      const DataCell(Text('191 KMs')),
                      const DataCell(
                          Text('104', style: TextStyle(color: Colors.red))),
                      const DataCell(Text('28,AI turath street',
                          style: TextStyle(color: Colors.blue))),
                      DataCell(Text('${car[index]['speed']} Kmph')),
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
                      DataCell(Text(car[index]['timestamp'])),
                      const DataCell(Icon(Icons.videocam, color: Colors.red)),
                      DataCell(Text('${car[index]['battery']}volts')),
                    ],
                  );
                }),

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
              ),
            ),
          );
        } else if (state is VehiclesGetFailure) {
          return const Text(
            'error occured ',
            style: TextStyle(color: Colors.red, fontSize: 20),
          );
        } else if (state is VehiclesInitial) {
          return const Text('this is the initial state of the table ');
        } else {
          return const Column(
            children: [Text('state management'), CustomLoadingIndicator()],
          );
        }
      },
    );
  }
}
