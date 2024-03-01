import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/constants.dart';


class RadioButtonsGroup extends StatefulWidget {
  final void Function(String role) onRoleSelected; // Callback function
  const RadioButtonsGroup({required this.onRoleSelected, super.key});

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
    widget.onRoleSelected(value);
  });
              },
            ),
            const Text('Manager',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 20),
            Radio(
              value: 'Operator',
              groupValue: _selectedRole,
              onChanged: (value) {

  setState(() {
    _selectedRole = value!;
    widget.onRoleSelected(value);
  });
              },
            ),
            const Text('Operator',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 20),
            Radio(
              value: 'Driver',
              groupValue: _selectedRole,
              onChanged: (value) {

  setState(() {
    _selectedRole = value!;
    widget.onRoleSelected(value);
  });
              },
            ),
            const Text('Driver',
                style: TextStyle(
                    fontSize: 16,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        
      ]),
    );
  }
}
