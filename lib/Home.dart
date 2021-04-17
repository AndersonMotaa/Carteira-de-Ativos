import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //_getUsuario();
    //nome = "funciona";
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(nome),
              accountEmail: Text(email),
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFF00B8D4),
              child: Icon(Icons.edit),
              onPressed: () {},
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(nome),
        backgroundColor: Color(0xFFf45d27),
      ),
      body: Container(),

      //Botão para adicionar novo ativo
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf5851f),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }

  List<String> emailString = <String>[""];
  List<String> nomeString = <String>[""];
  // String nome = "";
  Uri urlLogin = Uri.https(
      "investimentos-c0f48-default-rtdb.firebaseio.com", "/usuario.json");

  Future<void> _getUsuario0() {
    return http.get(urlLogin).then((response) {
      Map<String, dynamic> map = jsonDecode(response.body);
      map.forEach((key, value) {
        //print(listString.last);
        if (email == emailString.last) {
          //print("funciona");
          print(emailString.last);
          print(nomeString.last);
        } else {
          emailString.add(map[key]["email"]);
          nomeString.add(map[key]["nome"]);
          nome = nomeString.last;
          //print(emailString.last);
          //print(nomeString.last);
          print("denovo");
        }
      });
    });
  }

  Future<http.Response> updateAlbum(String nome) {
    return http.put(
      urlLogin,
      body: jsonEncode(<String, String>{
        'nome': nome,
      }),
    );
  }
}
