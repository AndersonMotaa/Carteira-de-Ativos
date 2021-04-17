import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cadastro_usuario extends StatefulWidget {
  @override
  _cadastro_usuarioState createState() => _cadastro_usuarioState();
}

class _cadastro_usuarioState extends State<cadastro_usuario> {
// String senha = "";
//String confirmarSenha = "";

  Widget _body() {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFf45d27),
                Color(0xFFf5851f),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(75),
            ),
          ),
          child: Image.asset(
            'assets/images/logo.png',
          ),
        ),
        //Nome do usuário
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          margin: EdgeInsets.only(
            top: 30,
            right: 16,
            left: 16,
          ),
          padding: EdgeInsets.only(
            top: 4,
            left: 16,
            right: 16,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: _controllerNome,
            decoration: InputDecoration(
              icon: Icon(
                Icons.account_box,
                color: Colors.grey,
              ),
              hintText: 'Nome',
            ),
          ),
        ),

        //Email
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          margin: EdgeInsets.only(
            top: 30,
            right: 16,
            left: 16,
          ),
          padding: EdgeInsets.only(
            top: 4,
            left: 16,
            right: 16,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: _controllerEmail,
            decoration: InputDecoration(
              icon: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              hintText: 'Email',
            ),
          ),
        ),

        //Senha
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          margin: EdgeInsets.only(
            top: 30,
            right: 16,
            left: 16,
          ),
          padding: EdgeInsets.only(
            top: 4,
            left: 16,
            right: 16,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: _controllerSenha,
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key_rounded,
                color: Colors.grey,
              ),
              hintText: 'Senha',
            ),
          ),
        ),

        //confirmacão da senha
        Container(
          width: MediaQuery.of(context).size.width / 1.2,
          height: 50,
          margin: EdgeInsets.only(
            top: 30,
            right: 16,
            left: 16,
          ),
          padding: EdgeInsets.only(
            top: 4,
            left: 16,
            right: 16,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 10,
              ),
            ],
          ),
          child: TextField(
            controller: _controllerConfirmarSenha,
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key_rounded,
                color: Colors.grey,
              ),
              hintText: ' Confirmar senha',
            ),
          ),
        ),

        //Botão Cadastrar
        new GestureDetector(
          onTap: () {
            _verificarSenha();
            Navigator.of(context).pushNamed('Login');
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 30,
              right: 16,
              left: 16,
            ),
            width: MediaQuery.of(context).size.width / 1.2,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFf45d27),
                  Color(0xFFf5851f),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Center(
              child: Text(
                'CADASTRAR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<String> listString = <String>[];
  Uri urlUsuario = Uri.https(
      "investimentos-c0f48-default-rtdb.firebaseio.com", "/usuario.json");
  Uri urlLogin = Uri.https(
      "investimentos-c0f48-default-rtdb.firebaseio.com", "/login.json");

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerConfirmarSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  void _verificarSenha() {
    if (_controllerSenha.text == _controllerConfirmarSenha.text) {
      _addLogin();
      _addUsuario();
    } else {
      print(_controllerSenha.text);
      print(_controllerConfirmarSenha.text);
      print("Erro!");
    }
  }

  void _addUsuario() {
    http.post(
      urlUsuario,
      body: json.encode(
        {
          "nome": _controllerNome.text,
          "email": _controllerEmail.text,
        },
      ),
    );
  }

  void _addLogin() {
    http.post(
      urlLogin,
      body: json.encode(
        {
          "email": _controllerEmail.text,
          "senha": _controllerSenha.text,
        },
      ),
    );
  }
}
