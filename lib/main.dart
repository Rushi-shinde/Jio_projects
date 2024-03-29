import 'package:jio_project/Screens2/login.dart';
import 'package:jio_project/Screens2/registration.dart';
import 'package:jio_project/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:jio_project/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage2(),
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.registrationRoute: (context) => const RegistrationPage2(),
        MyRoutes.loginRoute: (context) => LoginPage2(),
      },
    );
  }
}