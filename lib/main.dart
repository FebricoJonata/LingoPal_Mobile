import 'package:flutter/material.dart';
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/routes/app_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/view/components/localization.dart';

void main() async {
  // Init Supabase
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterFFmpegConfig().enableLogCallback(logCallback);
  var storage = const FlutterSecureStorage();
  Supabase.initialize(
    url: 'https://vfsijkhnwxfbsanoefua.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZmc2lqa2hud3hmYnNhbm9lZnVhIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxMjQ3MTYxOSwiZXhwIjoyMDI4MDQ3NjE5fQ.UnjnJOMv-Zrsr1t7WXsvt6WJ5-XrYAHFydb66FNGKU0',
  );
  String? token = await storage.read(key: 'token');
  await TranslationService.loadSavedLanguage();
  String initialRoute = (token != null) ? RouteName.basePage : RouteName.landingPage;
  runApp(MyApp(
    initialRoute: initialRoute,
  ));
}

ThemeData lightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: MyColors.primaryGreen,
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColors.primaryGreen,
      disabledColor: Colors.grey,
    ));

ThemeData darkTheme = ThemeData(
    hintColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.amber,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.grey,
    ));

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.initialRoute});
  final String initialRoute;
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
          initialRoute: initialRoute,
          translations: TranslationService(),
          locale: Get.locale,
          // themeMode: lightTheme,
          getPages: AppPages.pages,
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(),
            textSelectionTheme: const TextSelectionThemeData(cursorColor: MyColors.secondaryGreen, selectionHandleColor: MyColors.secondaryGreen, selectionColor: MyColors.primaryYellow),
            popupMenuTheme: const PopupMenuThemeData(color: MyColors.primaryYellow),
          ),
        );
      },
    );
  }
}
