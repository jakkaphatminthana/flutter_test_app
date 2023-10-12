import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:intl/intl.dart';

import '../resources/color_res.dart';
import '../resources/font_res.dart';
import '../resources/text_custom.dart';

showCustomMonthYearPicker({
  required BuildContext context,
  required DateTime initialMonth,
  required Function(DateTime) onSelectMonth,
  int monthOffset = 15,
}) {
  List<DateTime> pickerData = [];
  final now = DateTime.now();
  final List<int> initialSelectIndex = [];
  final DateTime startDate = DateTime(now.year, now.month - monthOffset);
  final int maximunMonth = monthOffset * 2 + 1;
  for (int i = 0; i <= maximunMonth; i++) {
    final temp = DateTime(startDate.year, startDate.month + i);
    pickerData.add(temp);

    if (temp.month == initialMonth.month && temp.year == initialMonth.year) {
      initialSelectIndex.add(i);
    }
  }

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
      title: const Expanded(
        child: CustomBoldText(
          'เลือกเดือน',
          fontSize: 18,
          textAlign: TextAlign.center,
        ),
      ),
      // Body Section
      textStyle: FontRes.getStyle(fontSize: 18),
      selectedTextStyle: FontRes.getBoldStyle(fontSize: 18),
      height: 375 / MediaQuery.of(context).size.width * 256,
      itemExtent: 42,
      columnPadding: const EdgeInsets.symmetric(horizontal: 16),
      selecteds: initialSelectIndex,
      onBuilderItem: (context, text, child, selected, col, index) {
        final monthName = DateFormat('MMMM').format(pickerData[index]);
        final buddhistYear = pickerData[index].year + 543;
        if (selected) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomBoldText(
                '$monthName $buddhistYear',
                fontSize: 16,
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                '$monthName $buddhistYear',
                fontSize: 16,
              ),
            ],
          );
        }
      },
      onConfirm: (picker, value) {
        final selectedIndex = value.last;
        final selected = pickerData[selectedIndex];
        onSelectMonth(selected);
      }).showModal(context, backgroundColor: Colors.transparent);
}
