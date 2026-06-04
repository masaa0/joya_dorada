import 'package:flutter_test/flutter_test.dart';
import 'package:joya_dorada/main.dart';

void main() {
  testWidgets('App loads Joya Dorada title', (WidgetTester tester) async {
    await tester.pumpWidget(const JoyaDoradaApp());
    await tester.pumpAndSettle();
    expect(find.text('Joya Dorada'), findsWidgets);
  });
}
