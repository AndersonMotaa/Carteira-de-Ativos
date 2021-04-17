import 'package:investimentos/Login.dart';
import 'package:investimentos/cadastro_usuario.dart';
import 'package:flutter/material.dart';
import 'package:investimentos/learn_firebase.dart';

import 'Home.dart';
import 'Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LearnFirebase(),

    //Todas as rotas de telas do aplicativo
    routes: {
      'Login': (context) => Login(),
      'cadastro_usuario': (context) => cadastro_usuario(),
      'Home': (context) => Home(),
    },
  ));
}
