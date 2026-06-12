import 'package:flutter/material.dart';
import 'package:phoenix/Utils/providers/chatlistprovider.dart';
import 'package:phoenix/Utils/providers/chatprovider.dart';
import 'package:phoenix/Utils/providers/itemprovider.dart';
import 'package:phoenix/Utils/providers/userprovider.dart';
import 'package:phoenix/pages/SplashScreen.dart';
import 'package:phoenix/pages/Viewitem.dart';
import 'package:phoenix/pages/chatlistpage.dart';
import 'package:phoenix/pages/chatpage.dart';
import 'package:phoenix/pages/frampage.dart';
import 'package:phoenix/pages/loginscreen.dart';
import 'package:phoenix/pages/register.dart';
import 'package:phoenix/pages/Profilepage.dart';
import 'package:phoenix/pages/Donate_SellPage.dart';
import 'package:phoenix/Utils/service/approutes.dart';
import 'package:provider/provider.dart';
import 'package:phoenix/Utils/providers/Themeprovider.dart';
import 'package:phoenix/pages/Homepage.dart';
import 'package:phoenix/SettingsPages/UpdateProfile.dart';
import 'package:phoenix/pages/Onboardingscreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Userprovider()),
        ChangeNotifierProvider(create: (_) => Itemprovider()),
        ChangeNotifierProvider(create: (_) => ChatListProvider()),
        ChangeNotifierProvider(create: (_) => Chatprovider()),

        ChangeNotifierProvider(create: (_) => Itemprovider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Approutes.splashscreen,

      // Light theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.black),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        cardColor: Colors.white,
      ),

      // Dark theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF1E1E2A),
      ),

      // Control which theme is active
      themeMode: themeProvider
          .themeMode, // system = auto, can be ThemeMode.light or ThemeMode.dark

      routes: {
        '/home': (context) => const Homepage(),
        Approutes.Loginscreen: (context) => Loginscreen(),
        Approutes.splashscreen: (context) => Splashscreen(),
        Approutes.register: (context) => register(),
        Approutes.fram: (context) => frampage(),
        Approutes.view: (context) => Viewitem(),
        Approutes.chatList: (context) => Chatlistpage(),
        Approutes.chatpage: (context) {
          final id = ModalRoute.of(context)!.settings.arguments as String;

          return Chatpage(reseverid: id);
        },
        Approutes.ProfilePage: (context) => ProfilePage(),
        Approutes.DonateOrsellPage: (context) => DonateOrsellpage(),
        Approutes.AccountScreen: (context) => const EditProfilePage(),
        Approutes.OnboardingScreen: (context) => const OnboardingScreen(),
      },
    );
  }
}
