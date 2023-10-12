import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:integration_test/integration_test.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  Future<dynamic> getCatData() async {
    final dio = Dio();
    final response =
        await dio.get('https://api.thecatapi.com/v1/images/search?limit=10');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load data");
    }
  }

  Future<dynamic> getMockData() async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);

    dio.httpClientAdapter = dioAdapter;
    const mockPath = 'https://example.com';
    const resData = '{"userId": 1, "title": "Hello", "body": "World"}';

    dioAdapter.onGet(mockPath, (server) => server.reply(200, resData));

    final response = await dio.get(mockPath);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("Failed to load data");
    }
  }

  //===============================================================================================================================
  group('Test API Response', () {
    testWidgets('API returns cat data', (tester) async {
      final data = await getCatData();
      expect(data.isNotEmpty, true);

      for (var catData in data) {
        expect(
          catData['url'],
          anyOf(contains('.jpg'), contains('.png'), contains('.gif')),
        );
      }
    });

    testWidgets('API returns mockup data', (tester) async {
      final data = await getMockData();
      expect(data.isNotEmpty, true);
      expect(data.contains("Hello"), true);
    });
  });
}
