import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:PaginaContador()));
}

class PaginaContador extends StatefulWidget{
  @override
  _PaginaContadorState createState() => _PaginaContadorState();
}

class _PaginaContadorState extends State<PaginaContador>{
  int contador = 0;

  void increment(){
    setState(() {
      contador++;
    });
  }
  void decrement(){
    setState(() {
      contador--;
    });
  }
  void reset(){
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      appBar: AppBar(
      title: Text("Meu App Interativo"),
      centerTitle: true,
      ),

      body: Center(
        child: Text("Cliques: $contador",
        style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 9, 255, 0),
            onPressed:increment,
            child: Icon(Icons.add),
          ),

          SizedBox(height: 12),

          FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 255, 0, 0),
            onPressed:decrement,
            child: Icon(Icons.remove),
          ),

          SizedBox(height: 12),

          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed:reset,
            child: Icon(Icons.restore),
          ),
        ],
       ),
    );
  }
}
