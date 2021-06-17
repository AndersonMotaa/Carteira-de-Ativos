import 'dart:ffi';

class Investimento {
  int id;
  String ativo;
  double valorMedio;
  double valorTotal;
  int quantidade;

  Investimento(this.ativo, this.valorMedio, this.valorTotal, this.quantidade);

  Investimento.fromMap(Map map) {
    this.id = map["id"];
    this.ativo = map["ativo"];
    this.valorMedio = map["valorMedio"];
    this.valorTotal = map["valorTotal"];
    this.quantidade = map["quantidade"];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      "ativo": this.ativo,
      "valorMedio": this.valorMedio,
      "valorTotal": this.valorTotal,
      "quantidade": this.quantidade,
    };
    if (this.id != null) {
      map["id"] = this.id;
    }
    return map;
  }
}
