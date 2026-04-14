import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Cadastro(),
  ));
}

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  List<Map<String, dynamic>> dados = [];
  int? idEditando;

  Future<Database> criarBanco() async {
    final caminho = await getDatabasesPath();
    final path = join(caminho, 'banco.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE dados(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT)',
        );
      },
    );
  }

  Future<void> inserirDado() async {
    final db = await criarBanco();

    await db.insert('dados', {
      'titulo': tituloController.text,
      'descricao': descricaoController.text,
    });

    limparCampos();
    carregarDados();
  }

  Future<void> atualizarDado() async {
    if (idEditando == null) return;

    final db = await criarBanco();

    await db.update(
      'dados',
      {
        'titulo': tituloController.text,
        'descricao': descricaoController.text,
      },
      where: 'id = ?',
      whereArgs: [idEditando],
    );

    limparCampos();
    carregarDados();
  }

  Future<void> deletarDado(int id) async {
    final db = await criarBanco();
    await db.delete('dados', where: 'id = ?', whereArgs: [id]);

    carregarDados();
  }

  Future<void> carregarDados() async {
    final db = await criarBanco();

    final lista = await db.query(
      'dados',
      orderBy: 'titulo ASC',
    );

    setState(() {
      dados = lista;
    });
  }

  void limparCampos() {
    tituloController.clear();
    descricaoController.clear();
    idEditando = null;
  }

  void selecionarParaEditar(Map<String, dynamic> item) {
    tituloController.text = item['titulo'];
    descricaoController.text = item['descricao'];
    idEditando = item['id'];
  }

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Banco de Dados')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: tituloController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () {
              if (idEditando == null) {
                inserirDado();
              } else {
                atualizarDado();
              }
            },
            child: Text(idEditando == null ? 'Salvar' : 'Atualizar'),
          ),

          Expanded(
            child: dados.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum item cadastrado',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: dados.length,
                    itemBuilder: (context, index) {
                      final item = dados[index];

                      return ListTile(
                        title: Text(item['titulo']),
                        subtitle: Text(item['descricao']),

                        onTap: () {
                          selecionarParaEditar(item);
                        },

                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => deletarDado(item['id']),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}