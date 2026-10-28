import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Menu shows shop name and first item', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MenuApp());

    expect(find.text('Petal & Bloom'), findsOneWidget);
    expect(find.text('Red Roses'), findsOneWidget);
  });
}
