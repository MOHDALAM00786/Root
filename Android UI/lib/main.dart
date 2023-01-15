import 'package:flutter/material.dart';

import 'user/login.dart';
import 'user/register.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login':(context)=>const Login(),
      'register':(context)=>const Register()
    },
  ));
}
