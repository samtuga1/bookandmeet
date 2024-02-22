import 'package:bookandmeet/src/data/data.dart';
import 'package:bookandmeet/src/router/app_router.dart';
import 'package:bookandmeet/src/router/routes.dart';
import 'package:bookandmeet/src/services/services.dart';
import 'package:bookandmeet/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signals/signals_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Watch.builder(
          builder: (ctx) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'bookandmeet',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light,
            darkTheme: AppTheme.dart,
            themeMode: getIt<ThemeController>().themeMode.value,
            initialRoute: Routes.initial,
            onGenerateRoute: AppRouter().onGenerateRoute,
          ),
        );
      },
    );
  }
}
