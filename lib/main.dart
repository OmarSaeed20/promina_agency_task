import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: MediaQuery.sizeOf(context),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
        builder: (context, child) => MaterialApp(
          title: "Gellary App",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: const Color(0xFF3a3fe9),
            brightness: Brightness.light,
            highlightColor: Colors.white,
            hintColor: const Color(0xFF9E9E9E),
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF3a3fe9),
              secondary: Color(0xFF004C8E),
              tertiary: Color(0xFFF9D4A8),
              tertiaryContainer: Color(0xFFADC9F3),
              onTertiaryContainer: Color(0xFF33AF74),
              onPrimary: Color(0xFF7FBBFF),
              background: Color(0xFFF4F8FF),
              onSecondary: Color(0xFFF88030),
              error: Color(0xFFFF5555),
              onSecondaryContainer: Color(0xFFF3F9FF),
              outline: Color(0xff2C66B4),
              onTertiary: Color(0xFFE9F3FF),
              primaryContainer: Color(0xFF9AECC6),
              secondaryContainer: Color(0xFFF2F2F2),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
                TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
              },
            ),
          ),
          // home: const LoginPage(),
          home: const MyHomePage(),
        ),
      ),
    );
  }
}
