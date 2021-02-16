import 'package:cateira_de_ativos/app_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePagestate();
  }
}

class HomePagestate extends State<HomePage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minha Carteira'),
          actions: [CustonSwitch()],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contador: $counter'),
              CustonSwitch(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              setState(() {
                counter++;
              });
            }));
  }
}

class CustonSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
        value: AppController.instance.isDarkTheme,
        onChanged: (value) {
          AppController.instance.changeTheme();
        });
  }
}
