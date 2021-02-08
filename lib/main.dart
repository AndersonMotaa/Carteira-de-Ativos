import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(AppWidget(
    title: 'Carteita de Ativos',
  ));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagestate();
  }
}

class HomePagestate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Carteira de Ativos'),
      ),
    );
  }
}
