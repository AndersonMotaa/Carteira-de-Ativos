import 'package:carteira_de_investimentos/Login.dart';
import 'package:carteira_de_investimentos/cadastro_usuario.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'Login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),

    //Todas as rotas de telas do aplicativo
    routes: {
      'Login': (context) => Login(),
      'cadastro_usuario': (context) => cadastro_usuario(),
      'Home': (context) => Home(),
    },
  ));
}
