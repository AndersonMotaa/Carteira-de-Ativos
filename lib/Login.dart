import 'dart:ui';

import 'package:carteira_de_investimentos/cadastro_usuario.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';

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
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.vpn_key_rounded,
                          color: Colors.grey,
                        ),
                        hintText: 'Password',
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
                        'Forgot password ?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  //login
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('Home');
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
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
                          'LOGIN',
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
                      margin: EdgeInsets.only(top: 30),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

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
}
