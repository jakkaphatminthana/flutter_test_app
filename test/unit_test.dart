import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_app/main.dart';
import 'package:flutter_test_app/test_flutter/unit_test.dart';

void main() {
  //TODO 1: Class
  group('User', () {
    test('Test User Name', () {
      final user = User();

      user.name = "Benznest";
      expect(user.name, "Benznest");
    });

    test('Test User Age', () {
      final user = User();

      user.age = 25;
      expect(user.age, 25);
    });
  });

  //TODO 2: Widget
  group('Find Widgets', () {
    //TODO 2.1: IsNothing
    testWidgets('finds a Text Widget', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Text('H'),
        ),
      );

      expect(find.text('X'), findsNothing);
    });

    testWidgets('finds a Text Widget by Widget', (WidgetTester tester) async {
      const Widget widget = Text("");

      await tester.pumpWidget(
        const MaterialApp(
          home: SizedBox(child: Center(child: widget)),
        ),
      );

      expect(find.byWidget(widget), findsOneWidget);
    });
  });

  //TODO 3: Simulator (Normal)
  group('Simulation event (normal)', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      expect(find.text('Home'), findsOneWidget);
      await tester.tap(find.text('Counter'));
      await tester.pumpAndSettle();

      // Verify that our counter starts at 0.
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      // Tap the '+' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });
  });

  //TODO 4: Simulator (Advance)
  Future<void> navigateToCounterScreen(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Home'), findsOneWidget);
    await tester.tap(find.text('Counter'));
    await tester.pumpAndSettle();
  }

  group('Simulator envent (advance)', () {
    testWidgets('Counter increments smoke test', (tester) async {
      await navigateToCounterScreen(tester);

      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter increments 1000 times', (tester) async {
      await navigateToCounterScreen(tester);

      for (int i = 0; i < 1000; i++) {
        expect(find.text('$i'), findsOneWidget);

        // Tap the '+' icon and trigger a frame.
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();

        expect(find.text((i + 1).toString()), findsOneWidget);
      }
    });
  });
}
