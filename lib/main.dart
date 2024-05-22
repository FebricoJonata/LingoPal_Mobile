import 'package:flutter/material.dart';
// import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lingo_pal_mobile/routes/app_page.dart';
import 'package:lingo_pal_mobile/routes/name_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  // Init Supabase
  // WidgetsFlutterBinding.ensureInitialized();
  // FlutterFFmpegConfig().enableLogCallback(logCallback);
  Supabase.initialize(
    url: 'https://vfsijkhnwxfbsanoefua.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZmc2lqa2hud3hmYnNhbm9lZnVhIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxMjQ3MTYxOSwiZXhwIjoyMDI4MDQ3NjE5fQ.UnjnJOMv-Zrsr1t7WXsvt6WJ5-XrYAHFydb66FNGKU0',
  );

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
          initialRoute: RouteName.landingPage,
          getPages: AppPages.pages,
          theme: ThemeData(textTheme: GoogleFonts.latoTextTheme()),
        );
      },
    );
  }
}
