import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Contatos(),
  ));
}

// TELA 1
class Contatos extends StatelessWidget {
  final String nome1 = "Charlo";
  final String nome2 = "Otavio";
  final String nome3 = "Murilo";

  final String telefone1 = "(19) 98701-4289";
  final String telefone2 = "(19) 97113-2021";
  final String telefone3 = "(19) 99949-5895";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        backgroundColor: const Color.fromARGB(255, 0, 247, 255),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Center(
              child: Text('Contato 1'),
            ),
            subtitle: Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Ver detalhes"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detalhes(nome: nome1, telefone: telefone1,),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ListTile(
            title: Center(
              child: Text('Contato 2'),
            ),
            subtitle: Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Ver detalhes"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detalhes(nome: nome2, telefone: telefone2,),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ListTile(
            title: Center(
              child: Text('Contato 3'),
            ),
            subtitle: Center(
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  child: Text("Ver detalhes"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detalhes(nome: nome3, telefone: telefone3),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// TELA 2
class Detalhes extends StatelessWidget {
  final String nome;
  final String telefone;

  const Detalhes({
    super.key,
    required this.nome,
    required this.telefone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhe'),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/murilo.png'),
            ),
            SizedBox(height: 20),
            Text(
              "Nome: $nome",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              "Telefone: $telefone",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}