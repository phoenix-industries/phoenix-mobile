import 'package:flutter/material.dart';
import 'package:phoenix/Utils/providers/itemprovider.dart';
import 'package:phoenix/pages/SplashScreen.dart';
import 'package:phoenix/pages/Viewitem.dart';
import 'package:phoenix/pages/frampage.dart';
import 'package:phoenix/pages/loginscreen.dart';
import 'package:phoenix/pages/register.dart';
import 'package:phoenix/Utils/service/approutes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Itemprovider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Approutes.splashscreen,
      routes: {
        Approutes.Loginscreen: (context) => Loginscreen(),
        Approutes.splashscreen: (context) => Splashscreen(),
        Approutes.register: (context) => register(),
        Approutes.fram: (context) => frampage(),
        Approutes.view: (context) => Viewitem(),
      },
    );
  }
}
