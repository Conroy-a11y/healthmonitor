// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:healthmonitor/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Ensure sqflite works for tests by using ffi implementation.
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    // Build the app and verify basic UI elements.
    await tester.pumpWidget(const HealthMVPApp());

    // Verify the app title is present and FAB exists.
    expect(find.text('Health Monitor MVP'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap the FAB to open the Add Measurement screen.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify the Add Measurement screen is shown.
    expect(find.text('Add Measurement'), findsOneWidget);
  });
}
