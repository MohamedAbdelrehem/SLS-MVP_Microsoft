// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sls_mvp_microsoft/constants.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_loading_indicator.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_snack_bar.dart';
import 'package:sls_mvp_microsoft/features/authentication/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:sls_mvp_microsoft/features/home/view_model/vehicles/vehicles_cubit.dart';

final _vehicleidcontroller = TextEditingController();

final _vehicletypecontroller = TextEditingController();
final _vehiclemodelcontroller = TextEditingController();
final _vehiclecolorcontroller =  TextEditingController();
final _vehiclefuelcapacitycontroller = TextEditingController();

  String? _vehicle3dModelPath;

//carid vehiclegroup
class CarViewBody extends StatelessWidget {
  const CarViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<VehiclesCubit, VehiclesState>(
      listener: (context, state) {
        if(state is VehiclesAddFailure){
          showSnackBar(context, "invalid");
        }else if(state is VehiclesAddSuccess){
          GoRouter.of(context).pushReplacement('/home');
        }
      },
      builder: (context, state) {
        if(state is VehiclesAddLoading){
          print('entereed loading state of adding');
          return const CustomLoadingIndicator();
                  }else {
String pathpass='';
        String typepass='';

return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                   

                    const SizedBox(height: 30),

                 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _vehicleidcontroller,
                            // obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Vehicle ID'),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),
                                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: TextField(
                            controller: _vehicletypecontroller,
                            // obscureText: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Vehicle Type'),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _vehiclemodelcontroller,
                // enabled: enabled,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Vehicle model'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _vehiclecolorcontroller,
                // enabled: enabled,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'vehicle color'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: _vehiclefuelcapacitycontroller,
                // enabled: enabled,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'vehicle fuel capacity'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),

 Upload3D(fileselected: (String path) { pathpass = path; },),
        const SizedBox(height: 10),

 DropdownMenuExample(typeselected: (String type) { typepass = type; },),

        const SizedBox(height: 10),

                    //signUp in Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: InkWell(
                        //GestureDetector to InkWell for animation
                        onTap: () {
                          print("Sign Up button tapped!");
                          BlocProvider.of<VehiclesCubit>(context).addVehicle(vehicleid: _vehicleidcontroller.text,vehicletype: _vehicletypecontroller.text, vehichlemodel: _vehiclemodelcontroller.text, vehiclecolor:_vehiclecolorcontroller.text, vehiclefueltype: typepass, vehiclefuelcapciaty: num.parse(_vehiclefuelcapacitycontroller.text), vehiclemodel3durlpath: pathpass);

                        },
                        
                        child: Ink(
                          //Container to Ink for animation
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: kSecondColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: const Center(
                            child: Text('Add Car',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    //not a  member button

                  ],
                ),
              ),
            ),
          ); 
                  }
      },
    );
     }
}


   final List<String> list = <String>['Gasoline', 'Electric', 'Hybrid'];

class DropdownMenuExample extends StatefulWidget {
    final void Function(String type) typeselected;

  const DropdownMenuExample({super.key, required this.typeselected});
  

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {


  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          widget.typeselected(value);
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
class Upload3D extends StatefulWidget {
  final void Function(String path) fileselected;
  const Upload3D({super.key, required this.fileselected});

  @override
  State<Upload3D> createState() => _Upload3DState();
}

class _Upload3DState extends State<Upload3D> {
    Future<void> pick3DModel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {

      
      setState(() {
        
        _vehicle3dModelPath = result.files.single.path;
        widget.fileselected(_vehicle3dModelPath!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return 
            Column(
              children: [
                Text('Vehicle 3D Model (GLB file):'),
                    SizedBox(width: 10),
            // Text(_vehicle3dModelPath!),
            ElevatedButton(
            onPressed: pick3DModel,
            child: Text('Select Model'),
          ),
          ],
        );



            
  }
}