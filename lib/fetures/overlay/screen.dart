import 'package:flutter/material.dart';

class OverlayScreen extends StatefulWidget {
  const OverlayScreen({super.key});

  @override
  State<OverlayScreen> createState() => _OverlayScreenState();
}

class _OverlayScreenState extends State<OverlayScreen> {
  //Entry
  OverlayEntry? entry;
  //ตำแหน่งของหน้าจอ (x,y)
  Offset offset = const Offset(20, 100);

  //TODO 1: Overlay show
  void showOverlay() {
    //Widget ที่จะทำ overlay
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
          //onPanUpdate = การลาก
          onPanUpdate: (details) {
            offset += details.delta;

            //บอกให้ entry สร้างใหม่
            entry!.markNeedsBuild();
          },
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.stop_circle_rounded),
            label: const Text('Record'),
          ),
        ),
      ),
    );

    //context ที่จะใช้ Overlay
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  //TODO 2: Overlay Off
  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
  }

  @override
  void dispose() {
    hideOverlay();
    super.dispose();
  }

//===========================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO : Show Overlay
            ElevatedButton.icon(
              onPressed: () => showOverlay(),
              icon: const Icon(Icons.visibility),
              label: const Text('Show Overlay Widget'),
            ),

            //TODO : Hide Overlay
            ElevatedButton.icon(
              onPressed: () => hideOverlay(),
              icon: const Icon(Icons.visibility_off),
              label: const Text('Hide Overlay Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
