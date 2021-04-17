import 'package:flutter/material.dart';
import 'package:investimentos/Home.dart';
import 'package:investimentos/Login.dart';
import 'package:investimentos/cadastro_usuario.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  @override
  _LearnFirebaseState createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
