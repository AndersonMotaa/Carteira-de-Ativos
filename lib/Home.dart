import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meus Investimentos"),
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
}
