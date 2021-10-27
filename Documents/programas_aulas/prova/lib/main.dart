
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}
//Maite Renzano

enum operacao { adicao, subtracao, multiplicacao, divisao }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  operacao? _operacao;
  TextEditingController n1Controller = TextEditingController();
  TextEditingController n2Controller = TextEditingController();
  //TextEditingController resultController = TextEditingController();


  var resultado;
  void calculadora(value) {
    setState(() {
      _operacao = value;

      if (value == operacao.adicao) {
        resultado = int.parse(n1Controller.text) + int.parse(n2Controller.text);
      } else if (value == operacao.subtracao) {
        resultado = int.parse(n1Controller.text) - int.parse(n2Controller.text);
      } else if (value == operacao.multiplicacao) {
        resultado = int.parse(n1Controller.text) * int.parse(n2Controller.text);
      } else if (value == operacao.divisao) {
        resultado = int.parse(n1Controller.text) / int.parse(n2Controller.text);
      }
    });
  }

  

  Widget buildTextField(String label, TextEditingController contr){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, right: 50.0, left: 50.0),
      child: TextField(
                decoration: InputDecoration(
                  labelText: label, labelStyle:  TextStyle(color: Colors.pink, fontSize:  20.0),
                  border: OutlineInputBorder()
                ),
                style: TextStyle(color: Colors.grey, fontSize: 25.0),
                keyboardType: TextInputType.number,
                controller: contr,
              ),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Calculadora"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            buildTextField("Número 1", n1Controller),
            buildTextField("Número 2", n2Controller),
            //buildTextField("Resultado", resultController),
            
            SizedBox(height: 20),
            Text("Escolha a operação:", style: TextStyle(color: Colors.pink, fontSize: 20.0),),
            ListTile(
              title: const Text('Adição',style: TextStyle(color: Colors.grey, fontSize: 20.0),),
              leading: Radio<operacao>(
                value: operacao.adicao,
                groupValue: _operacao,
                onChanged: (operacao? value) {
                  calculadora(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Subtração',style: TextStyle(color: Colors.grey, fontSize: 20.0),),
              leading: Radio<operacao>(
                value: operacao.subtracao,
                groupValue: _operacao,
                onChanged: (operacao? value) {
                  calculadora(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Multiplicação',style: TextStyle(color: Colors.grey, fontSize: 20.0),),
              leading: Radio<operacao>(
                value: operacao.multiplicacao,
                groupValue: _operacao,
                onChanged: (operacao? value) {
                  calculadora(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Divisão',style: TextStyle(color: Colors.grey, fontSize: 20.0),),
              leading: Radio<operacao>(
                value: operacao.divisao,
                groupValue: _operacao,
                onChanged: (operacao? value) {
                  calculadora(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 20.0, right: 50.0, left: 50.0),
              child: Row(
                children: [
                  
                  Text("Resultado: ", style: TextStyle(color: Colors.pink, fontSize: 20.0),),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration( border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: resultado != null
                              ? Text(resultado.toString(), style: TextStyle(color: Colors.grey, fontSize: 40.0),)
                              : Text( "", style: TextStyle(color: Colors.grey, fontSize: 40.0),)),
                                  
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),  
    );
  }
}