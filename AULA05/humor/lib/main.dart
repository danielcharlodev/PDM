import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HumorApp(),
  ));
}

class HumorApp extends StatefulWidget {
  @override
  _HumorAppState createState() => _HumorAppState();
}

class _HumorAppState extends State<HumorApp> {

  int estado = 0;
  // 0 = Feliz
  // 1 = Neutro
  // 2 = Bravo

  void mudarHumor() {
    setState(() {
      estado++;
      if (estado > 2) {
        estado = 0;
      }
    });
  }

  String getEmoji() {
    switch (estado) {
      case 0:
        return "😀";
      case 1:
        return "😐";
      case 2:
        return "😡";
      default:
        return "😐";
    }
  }

  String getNomeEstado() {
    switch (estado) {
      case 0:
        return "Feliz";
      case 1:
        return "Neutro";
      case 2:
        return "Bravo";
      default:
        return "Neutro";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Botão de Humor"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              getEmoji(),
              style: TextStyle(fontSize: 120),
            ),

            SizedBox(height: 40),

            ElevatedButton(
              onPressed: mudarHumor,
              child: Text(
                getNomeEstado(),
                style: TextStyle(fontSize: 18),
              ),
            ),

          ],
        ),
      ),
    );
  }
}