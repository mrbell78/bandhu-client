import 'package:bondu/settings/settings.dart';
import 'package:bondu/signup/login_controller.dart';
import 'package:bondu/signup/signup_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'chat/chat_controller.dart';
import 'chat/chat_with_bandhu.dart';
import 'chat/sample_chat.dart';
import 'custommer_care/CustommerSupport.dart';
import 'home/nav_root.dart';
import 'home/profile.dart';
import 'home/profile_controller.dart';
import 'home/signin_welcome.dart';
import 'home/splash_screen.dart';
import 'locator/locator.dart';
import 'dart:io';
import 'login/registration.dart';
import 'login/loginas_guest.dart';
import 'main_service/Service.dart';
import 'main_service/gender_base_vaiolance.dart';
import 'main_service/shr_service.dart';
import 'signup/signup_phone_number.dart';

void main() async{

  HttpOverrides.global = MyHttpOverrides();
  await setupLocator();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChatController()),
        ChangeNotifierProvider(create: (context) => CustommerLoginController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
        builder: EasyLoading.init(),
      //  home: LoginAsGuest(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

