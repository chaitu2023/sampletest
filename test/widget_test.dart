import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:text/main.dart';

void main() {
  testWidgets('Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the main title is displayed.
    expect(find.byKey(const Key('mainTitleText')), findsOneWidget);

    // Verify that the subtitle is displayed.
    expect(find.byKey(const Key('subtitleText')), findsOneWidget);

    // Verify that the email field is initially populated.
    expect(find.byKey(const Key('emailTextField')), findsOneWidget);
    expect(find.text('sample@gmail.com'), findsOneWidget);

    // Verify that the password field is initially populated.
    expect(find.byKey(const Key('passwordTextField')), findsOneWidget);
    expect(find.text('sample'), findsOneWidget);

    // Enter valid credentials.
    await tester.enterText(find.byKey(const Key('emailTextField')), 'sample@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordTextField')), 'sample');

    // Tap the submit button.
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pumpAndSettle();

    // Verify that the Home Page is displayed.
    expect(find.byKey(const Key('welcomeToHomePageText')), findsOneWidget);

    // Tap the Go to Next Page button.
    await tester.tap(find.byKey(const Key('goToNextPageButton')));
    await tester.pumpAndSettle();

    // Verify that the Next Page is displayed.
    expect(find.byKey(const Key('everythingIsWorkingText')), findsOneWidget);
  });
}
