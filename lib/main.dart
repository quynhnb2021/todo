import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app/modules/complete_task_page/controllers/complete_task_page_controller.dart';
import 'package:todo/app/routes/app_pages.dart';

import 'app/modules/all_task_page/controllers/all_task_page_controller.dart';
import 'app/modules/incomplete_task_page/controllers/incomplete_task_page_controller.dart';

void main() {
  configApp();
  runApp(
    GetMaterialApp(
      title: 'E-Learning',
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.lexendDecaTextTheme(),
        backgroundColor: Colors.white,
        primaryColor: Colors.white,
        dividerColor: Colors.transparent,
        shadowColor: Colors.transparent,
        appBarTheme: AppBarTheme(elevation: 0),
      ),
      defaultTransition: Transition.native,
      translationsKeys: AppTranslation.translations,
      locale: Locale('vi', 'VN'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
    ),
  );
}

Future<void> configApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
}
