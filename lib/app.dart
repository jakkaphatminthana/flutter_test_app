import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/fetures/animation/screen.dart';
import 'package:flutter_test_app/fetures/foot_step/foot_step_screen.dart';
import 'package:flutter_test_app/fetures/overlay/screen.dart';
import 'package:flutter_test_app/fetures/overlay_animation/screen.dart';
import 'package:flutter_test_app/fetures/picker_custom/screen.dart';
import 'package:flutter_test_app/test_flutter/unit_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //TODO : Button Push Screen
  Widget _listScreen({
    required BuildContext context,
    required String title,
    required Widget Function(BuildContext) press,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: press,
          ),
        );
      },
      child: Text(title),
    );
  }

  Future<dynamic> getMockData() async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
    const mockPath = 'https://example.com';
    const postData = '{"userId": 1, "title": "Hello", "body": "World"}';
    dioAdapter.onGet(mockPath, (server) => server.reply(200, postData));

    final response = await dio.get(mockPath);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load data");
    }
  }

  //=======================================================================================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            //TODO : Picker Custom
            _listScreen(
              context: context,
              title: '🎴 Picker Custom Screen',
              press: (context) => const PickerCustomScreen(),
            ),
            const SizedBox(height: 8),

            //TODO : Overlay simple
            _listScreen(
              context: context,
              title: '🕸️ Overlay Simple',
              press: (context) => const OverlayScreen(),
            ),
            const SizedBox(height: 8),

            //TODO : Overlay Animation
            _listScreen(
              context: context,
              title: '🕸️ Overlay Animation',
              press: (context) => const OverlayAnimationScreen(),
            ),
            const SizedBox(height: 8),

            //TODO : Animation Simple
            _listScreen(
              context: context,
              title: '🧙 Animation Simple',
              press: (context) => const AnimationSimpleScreen(),
            ),
            const SizedBox(height: 8),

            //TODO : Foot Step
            _listScreen(
              context: context,
              title: 'Foot Step',
              press: (context) => const FootStepScreen(),
            ),

            //TODO : Counter (For Tester)
            _listScreen(
              context: context,
              title: 'Counter',
              press: (context) => const TestCounterButton(),
            ),
            const SizedBox(height: 8),

            MaterialButton(
              child: const Text("Response"),
              onPressed: () async {
                final data = await getMockData();
                log("data : $data");
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
