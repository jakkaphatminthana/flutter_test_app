import 'package:flutter/material.dart';
import 'package:flutter_test_app/fetures/picker_custom/widgets/date_picker.dart';
import 'package:flutter_test_app/fetures/picker_custom/widgets/time_picker.dart';

class PickerCustomScreen extends StatefulWidget {
  const PickerCustomScreen({super.key});

  @override
  State<PickerCustomScreen> createState() => _PickerCustomScreenState();
}

class _PickerCustomScreenState extends State<PickerCustomScreen> {
  var now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker Custom')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showCustomMonthYearPicker(
                  context: context,
                  initialMonth: DateTime(now.year, now.month),
                  onSelectMonth: (value) {},
                );
              },
              child: const Text('Date Picker'),
            ),
            ElevatedButton(
              onPressed: () {
                showCustomTimePicker(
                  context: context,
                  initialTime: DateTime.now(),
                  onSelectTime: (value) {},
                );
              },
              child: const Text('Time Picker'),
            ),
          ],
        ),
      ),
    );
  }
}
