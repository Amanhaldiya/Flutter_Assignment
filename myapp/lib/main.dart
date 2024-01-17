import 'package:flutter/material.dart';

import 'package:myapp/UI/Login_page.dart';
// Authentication Bloc



void main() => runApp(const MyApp());




class MyApp extends StatelessWidget 
{
  const MyApp({super.key});
// this is the main application widget
  @override
  Widget build(BuildContext context) 
  {
    const appTitle = 'Employee Login';
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: const LoginPage(),
      theme: ThemeData
      (
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        ),
       ),
    );
  }
}