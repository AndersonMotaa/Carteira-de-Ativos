import 'package:flutter/material.dart';

class cadastro_usuario extends StatefulWidget {
  @override
  _cadastro_usuarioState createState() => _cadastro_usuarioState();
}

class _cadastro_usuarioState extends State<cadastro_usuario> {
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
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key_rounded,
                color: Colors.grey,
              ),
              hintText: 'Password',
            ),
          ),
        ),

        //Repeat Password - confirmacão da senha
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
            decoration: InputDecoration(
              icon: Icon(
                Icons.vpn_key_rounded,
                color: Colors.grey,
              ),
              hintText: ' Repeat Password',
            ),
          ),
        ),

        //Botão Cadastrar
        new GestureDetector(
          onTap: () {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }
}
