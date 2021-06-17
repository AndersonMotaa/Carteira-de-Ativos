import 'package:investimentos/Model/investimento.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class InvestimentoHelper {
  static final String tabela = "investimento";
  static final InvestimentoHelper _investimentoHelper =
      InvestimentoHelper._internal();
  Database _db;

  factory InvestimentoHelper() {
    return _investimentoHelper;
  }
  InvestimentoHelper._internal() {}

  get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await inicializarDB();
      return _db;
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $tabela("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "ativo VARCHAR, "
        "valorMedio REAL,"
        "quantidade INTEGER,"
        "valorTotal REAL)";
    await db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "banco_meus_investimentos");
    var db =
        await openDatabase(localBancoDados, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> salvarInvestimento(Investimento investimento) async {
    var bancoDados = await db;
    int resultado = await bancoDados.insert(tabela, investimento.toMap());
    return resultado;
  }

  recuperarInvestimentos() async {
    var bancoDados = await db;

    String sql = "SELECT * FROM $tabela";
    List investimentos = await bancoDados.rawQuery(sql);
    return investimentos;
  }
}
