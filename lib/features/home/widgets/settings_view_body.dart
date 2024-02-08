import 'package:flutter/material.dart';
import 'package:sls_mvp_microsoft/core/utils/styles.dart';
import 'package:sls_mvp_microsoft/core/widgets/custom_container.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Expanded(
        child: CustomContainer(
          width: 500,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'settings',
                  style: Styles.textStyle30,
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text('Manager code', style: Styles.textStyle18),
                    ),
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: '5D8SV896'),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.light_mode),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.dark_mode),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
