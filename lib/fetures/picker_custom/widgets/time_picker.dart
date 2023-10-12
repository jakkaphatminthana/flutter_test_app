import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:intl/intl.dart';

import '../resources/color_res.dart';
import '../resources/font_res.dart';
import '../resources/text_custom.dart';

showCustomTimePicker({
  required BuildContext context,
  required DateTime initialTime,
  DateTime? startRange,
  DateTime? endRange,
  required Function(DateTime) onSelectTime,
}) {
  DateFormat timeFormat = DateFormat('HH:mm');
  List<DateTime> pickerData = [];
  final List<int> initialSelectIndex = [0];
  final now = DateTime.now();
  startRange ??= DateTime(now.year, now.month, now.day, 0, 0);
  endRange ??= DateTime(now.year, now.month, now.day, 23, 30);

  int i = startRange.hour;
  int end = endRange.hour;

  for (i; i <= end; i++) {
    final fullHour = DateTime(now.year, now.month, now.day, i, 0);
    if (i == startRange.hour) {
      if (startRange.minute != 30) {
        pickerData.add(fullHour);
      }
    } else {
      pickerData.add(fullHour);
    }
    final halfHour = DateTime(now.year, now.month, now.day, i, 30);
    if (i != end) {
      pickerData.add(halfHour);
    } else {
      if (endRange.minute == 30) {
        pickerData.add(halfHour);
      } else {
        break;
      }
    }
  }

  initialSelectIndex.first = pickerData.indexOf(DateTime(
      now.year, now.month, now.day, initialTime.hour, initialTime.minute));

  Picker(
      adapter: PickerDataAdapter<String>(pickerData: pickerData),
      // Header Section
      headerDecoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      confirmText: 'ตกลง',
      confirmTextStyle: FontRes.getStyle(fontSize: 16, color: ColorRes.primary),
      cancelText: 'ยกเลิก',
      cancelTextStyle: FontRes.getStyle(fontSize: 16, color: ColorRes.negative),
      title: const CustomBoldText(
        'เลือกเวลา',
        fontSize: 18,
        textAlign: TextAlign.center,
      ),
      // Body Section
      textStyle: FontRes.getStyle(fontSize: 18),
      selectedTextStyle: FontRes.getBoldStyle(fontSize: 18),
      height: 375 / MediaQuery.of(context).size.width * 256,
      itemExtent: 42,
      columnPadding: const EdgeInsets.symmetric(horizontal: 16),
      selecteds: initialSelectIndex,
      onBuilderItem: (context, text, child, selected, col, index) {
        if (selected) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBoldText(
                timeFormat.format(pickerData[index]),
                fontSize: 16,
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                timeFormat.format(pickerData[index]),
                fontSize: 16,
              ),
            ],
          );
        }
      },
      onConfirm: (picker, value) {
        final selectedIndex = value.last;
        final selected = pickerData[selectedIndex];
        onSelectTime(selected);
      }).showModal(context, backgroundColor: Colors.transparent);
}
