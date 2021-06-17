import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:investimentos/Model/investimento.dart';
import 'package:investimentos/helper/InvestimentoHelper.dart';
import 'Login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _ativoController = TextEditingController();
  TextEditingController _valorController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();
  List<Investimento> _investimentos = List<Investimento>();

  var _db = InvestimentoHelper();

  _exibirCadastroAtivo() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Adicionar Ativo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _ativoController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Ativo",
                    hintText: "Digíte seu ativo",
                  ),
                ),
                TextField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: "Valor Médio",
                    hintText: "Digíte o valor médio",
                  ),
                ),
                TextField(
                  controller: _quantidadeController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Quantidade",
                    hintText: "Digíte a quantidade",
                  ),
                )
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    _salvarInvestimento();
                    Navigator.pop(context);
                  },
                  child: Text("Adicionar"))
            ],
          );
        });
  }

  _recuperarInvestimento() async {
    List investimentosRecuperados = await _db.recuperarInvestimentos();
    List<Investimento> listaTemporaria = List<Investimento>();
    for (var item in investimentosRecuperados) {
      Investimento investimento = Investimento.fromMap(item);
      listaTemporaria.add(investimento);
    }

    setState(() {
      _investimentos = listaTemporaria;
    });
    listaTemporaria = null;
  }

  _salvarInvestimento() async {
    String ativo = _ativoController.text;
    String valor = _valorController.text;
    double valorMedio = double.parse(valor);
    String quant = _quantidadeController.text;
    int quantidade = int.parse(quant);
    double valorTotal = quantidade * valorMedio;
    Investimento investimento =
        Investimento(ativo, valorMedio, valorTotal, quantidade);
    int resultado = await _db.salvarInvestimento(investimento);
    _ativoController.clear();
    _valorController.clear();
    _quantidadeController.clear();

    _recuperarInvestimento();
  }

  @override
  void initState() {
    super.initState();
    _recuperarInvestimento();
  }

  @override
  Widget build(BuildContext context) {
    //_getUsuario();
    //nome = "funciona";
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
        backgroundColor: Color(0xFFf45d27),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _investimentos.length,
                  itemBuilder: (context, index) {
                    final investimento = _investimentos[index];
                    return Card(
                      child: ListTile(
                        title: Text(investimento.ativo),
                        subtitle: Text(
                            "Valor Médio= ${investimento.valorMedio} Quant= ${investimento.quantidade} Total= ${investimento.valorTotal}"),
                      ),
                    );
                  }))
        ],
      ),

      //Botão para adicionar novo ativo
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFf5851f),
        child: Icon(Icons.add),
        onPressed: () {
          _exibirCadastroAtivo();
        },
      ),
    );
  }

  List<String> emailString = <String>[""];
  List<String> nomeString = <String>[""];
}
