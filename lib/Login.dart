import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:investimentos/cadastro_usuario.dart';
import 'package:flutter/material.dart';

String email = "";
String senha = "";
String nome = "";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget _body() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
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
            //Inputs
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.only(top: 42),
              child: Column(
                children: <Widget>[
                  //Email
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
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

                  //Password
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: 50,
                    margin: EdgeInsets.only(top: 30),
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
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key_rounded,
                          color: Colors.grey,
                        ),
                        hintText: 'Senha',
                      ),
                    ),
                  ),
                  //Forgot password
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                        right: 32,
                      ),
                      child: Text(
                        'Esqueceu sua senha ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  //login
                  GestureDetector(
                    onTap: () {
                      _getEmail();
                      //Navigator.of(context).pushNamed('Home');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
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
                          'ENTRAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //Cadastrar
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('cadastro_usuario');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 15),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  //String email = '';
  //String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(),
          _body(),
        ],
      ),
    );
  }

  List<String> loginString = <String>[""];
  List<String> senhaString = <String>[""];
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  Uri urlLogin = Uri.https(
      "investimentos-48662-default-rtdb.firebaseio.com", "/login.json");

  Future<void> _getEmail() {
    return http.get(urlLogin).then((response) {
      Map<String, dynamic> map = jsonDecode(response.body);
      map.forEach((key, value) {
        //print(listString.last);
        if (_controllerEmail.text == loginString.last &&
            _controllerSenha.text == senhaString.last) {
          email = _controllerEmail.text;
          senha = _controllerSenha.text;
          //print(teste);
          //print(loginString.last);
          //print(senhaString.last);
          _getUsuario();
          Navigator.of(context).pushNamed('Home');
        } else {
          loginString.add(map[key]["email"]);
          senhaString.add(map[key]["senha"]);
          //print(loginString.last);
          //print(senhaString.last);
          //print("denovo");
        }
      });
    });
  }

  List<String> emailString = <String>[""];
  List<String> nomeString = <String>[""];

  Uri urlUsuario = Uri.https(
      "investimentos-48662-default-rtdb.firebaseio.com", "/usuario.json");

  Future<void> _getUsuario() {
    return http.get(urlUsuario).then((response) {
      Map<String, dynamic> map = jsonDecode(response.body);
      map.forEach((key, value) {
        //print(listString.last);
        if (email == emailString.last) {
          //print("funciona");
          print(emailString.last);
          print(nomeString.last);
          nome = nomeString.last;
        } else {
          emailString.add(map[key]["email"]);
          nomeString.add(map[key]["nome"]);
          //nome = nomeString.last;
          //print(emailString.last);
          //print(nomeString.last);
          print("denovo");
        }
      });
    });
  }
}
