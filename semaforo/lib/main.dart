import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SemaforoApp()));
}

class SemaforoApp extends StatefulWidget {
  @override
  _SemaforoAppState createState() => _SemaforoAppState();
}

class _SemaforoAppState extends State<SemaforoApp> {
  int estado = 0;

  void mudarSemaforo() {
    setState(() {
      estado++;
      if (estado > 2) {
        estado = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("Semáforo de Trânsito"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Semáforo", style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),

            Container(
              width: 160, // maior
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Vermelho
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: estado == 2 ? Colors.red : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Amarelo
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: estado == 1 ? Colors.yellow : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(height: 15),

                  // Verde
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: estado == 0 ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  estado == 2
                      ? Icons.directions_walk
                      : Icons.pan_tool,
                  size: 80, // mesmo tamanho sempre
                  color: estado == 2 ? Colors.green : Colors.red,
                ),
                SizedBox(height: 10),
                Text(
                  estado == 2
                      ? "PEDESTRE: ATRAVESSE"
                      : "PEDESTRE: AGUARDE",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              ],
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: mudarSemaforo,
              child: Text("Trocar"),
            )
          ],
        ),
      ),
    );
  }
}