import 'package:flutter_test/flutter_test.dart';
import 'package:lorry_adda_admin/main.dart';

void main() {
  testWidgets('Login screen smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LorryAddaAdminApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome to, Lorry'), findsOneWidget);
  });
}
