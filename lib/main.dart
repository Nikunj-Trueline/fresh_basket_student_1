import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fresh_basket_mine/prefrence/prefrence_sevicies.dart';
import 'package:fresh_basket_mine/routes/project_routes.dart';
import 'package:fresh_basket_mine/theme/app_theme.dart';
import 'constant/string_constant.dart';
import 'mediaquery/media_query.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCpobY8CdOAA-NG-cv3obfK1Q9_JDYRNHw",
      appId: "1:1038016677094:android:050def634d87a15f1a6727",
      messagingSenderId: "1038016677094",
      projectId: "fresh-basket-6595d",
    ),
  );
  await PrefrenceServicies.onInit();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MediaQueryHelper.onInit(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.splashScreen,
    );
  }
}
