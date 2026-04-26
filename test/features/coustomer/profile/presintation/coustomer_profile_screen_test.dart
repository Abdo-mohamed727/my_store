import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_store/core/services/shared_pref/share_pref.dart';
import 'package:my_store/core/style/theme/app_theme.dart';
import 'package:my_store/features/auth/data/models/user_role_response.dart';
import 'package:my_store/features/coustomer/profile/data/datasources/profile_local_data_source.dart';
import 'package:my_store/features/coustomer/profile/presintation/bloc/profile_bloc.dart';
import 'package:my_store/features/coustomer/profile/presintation/screens/coustomer_profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await SharedPref().instantiatePreferences();
  });

  Widget pumpView(ProfileLocalDataSource source) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        theme: themeDark(),
        home: CoustomerProfileScreen(bloc: ProfileBloc(source)),
      ),
    );
  }

  testWidgets('renders profile header and settings overview', (tester) async {
    await tester.pumpWidget(pumpView(_ProfileTestLocalDataSource()));
    await tester.pumpAndSettle();
    expect(find.text('Jhon'), findsOneWidget);
    expect(find.text('Application Features'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Dark Mode'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });

  testWidgets('renders shimmer while loading', (tester) async {
    await tester.pumpWidget(pumpView(_ProfileTestLocalDataSource()));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('Jhon'), findsNothing);
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pumpAndSettle();
  });

  testWidgets('renders fallback contact text when data is missing', (
    tester,
  ) async {
    await tester.pumpWidget(pumpView(_FallbackProfileLocalDataSource()));
    await tester.pumpAndSettle();
    expect(find.text('Contact info unavailable'), findsOneWidget);
  });
}

class _ProfileTestLocalDataSource extends ProfileLocalDataSource {
  @override
  Future<UserRoleResponse> fetchProfileSummary() async {
    await Future<void>.delayed(const Duration(milliseconds: 450));
    return UserRoleResponse(
      userRole: 'customer',
      userId: 1,
      name: 'Jhon',
      email: 'john@mail.com',
      avatar: null,
    );
  }
}

class _FallbackProfileLocalDataSource extends ProfileLocalDataSource {
  @override
  Future<UserRoleResponse> fetchProfileSummary() async {
    return UserRoleResponse(
      userRole: 'customer',
      userId: 1,
      name: 'Jhon',
      email: null,
      avatar: null,
    );
  }
}
