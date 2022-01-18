import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli/core/locales.g.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/app/routes/app_pages.dart';

void main() {
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
