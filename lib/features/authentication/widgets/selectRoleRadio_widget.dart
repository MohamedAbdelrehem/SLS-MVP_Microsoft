import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/constants.dart';

final _managerCodeController = TextEditingController();

class RadioButtonsGroup extends StatefulWidget {
  @override
  _RadioButtonsGroupState createState() => _RadioButtonsGroupState();
}

class _RadioButtonsGroupState extends State<RadioButtonsGroup> {
  String _selectedRole = 'Manager';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'Manager',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            Text('Manager',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
            SizedBox(width: 20),
            Radio(
              value: 'Operator',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            Text('Operator',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
            SizedBox(width: 20),
            Radio(
              value: 'Driver',
              groupValue: _selectedRole,
              onChanged: (value) {
                setState(() {
                  _selectedRole = value!;
                });
              },
            ),
            Text('Driver',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        SizedBox(height: 25),

        // Manager code text box
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
                controller: _managerCodeController,
                enabled: _selectedRole != 'Manager' ? true : false,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Manger Code'),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ]),
    );
  }
}
