import 'package:flutter/material.dart';
import 'package:flutter_test_app/fetures/overlay_animation/widget/overlay_message.dart';

class OverlayAnimationScreen extends StatefulWidget {
  const OverlayAnimationScreen({super.key});

  @override
  State<OverlayAnimationScreen> createState() => _OverlayAnimationScreenState();
}

class _OverlayAnimationScreenState extends State<OverlayAnimationScreen>
    with TickerProviderStateMixin {
  GlobalKey appBarKey = GlobalKey();
  OverlayEntry? overlayEntry;

  late AnimationController animationController;
  late Animation<double> animation;

  //TODO : Show Overlay
  void showOverlay() async {
    //*ทำให้มันทับซ้อนกัน
    OverlayState overlayState = Overlay.of(context);

    //*Build the OverlayEntry widget
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top,
        child: Material(
          color: Colors.transparent,
          child: Opacity(
            opacity: animation.value,
            child: const AlertMessageOverlay(),
          ),
        ),
      ),
    );

    //*Update the overlay when the animation value changes
    animationController.addListener(() {
      overlayState.setState(() {});
    });

    //*Show the overlay
    overlayState.insert(overlayEntry!);
    animationController.forward();

    //*Remove the overlay after a delay
    await Future.delayed(const Duration(seconds: 5)).whenComplete(() {
      //reverse ย้อนกลับกัน
      animationController.reverse().whenComplete(() {
        overlayEntry!.remove();
      });
    });
  }

  //TODO : InitState
  @override
  void initState() {
    super.initState();
    //*สร้าง AnimationController เพื่อควบคุมแอนิเมชัน
    animationController = AnimationController(
      //กำหนด vsync เป็น this เพื่อเชื่อมต่อกับ TickerProviderStateMixin ในคลาสปัจจุบัน
      vsync: this,
      //กำหนดระยะเวลาในการเล่นแอนิเมชันเป็น 1 วินาที
      duration: const Duration(seconds: 1),
    );

    //ค่าที่ Animation จะเปลี่ยนแปลงตามเวลาที่กำหนดไว้ใน AnimationController ของเรา
    animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
  }

  //TODO : Dispose the animation controller
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //========================================================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: appBarKey,
        title: const Text('Overlay Animation'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: showOverlay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                child: const Text('Show Overlay'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
