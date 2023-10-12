import 'package:flutter/material.dart';

import '../../../resources/font.dart';

class AlertMessageOverlay extends StatelessWidget {
  const AlertMessageOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3), // กำหนดตำแหน่งเงาแนวนอนและแนวตั้ง
          ),
        ],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle),
          const SizedBox(width: 16),
          Text('ยื่นคำขอสำเร็จ!', style: textDescription1)
        ],
      ),
    );
  }
}
