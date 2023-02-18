import 'package:flutter/material.dart';

import 'home.dart';
import 'user/login.dart';
import 'user/register.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {'login':(context)=>const Login(),
      'register':(context)=>const Register(),
      'home':(context)=>const Home()
    },
  ));
}
