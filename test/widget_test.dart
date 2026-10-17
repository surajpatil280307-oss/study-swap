import 'package:flutter/material.dart';
import 'package:study_swap/main.dart';

void main() {
  testWidgets('StudySwap app loads login screen', (tester) async {
    await tester.pumpWidget(const StudySwapApp());
    expect(find.text('StudySwap'), findsWidgets);
    expect(find.text('Welcome back'), findsOneWidget);
  });
}
