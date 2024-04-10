import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo_pal_mobile/routes/app_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1179, 2556),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LingoPal',
          initialRoute: RouteName.loginPage,
          getPages: AppPages.pages,
          theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        );
      },
    );
  }
}
