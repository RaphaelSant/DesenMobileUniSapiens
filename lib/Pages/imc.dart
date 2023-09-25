import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class Imc extends StatefulWidget {
  @override
  _Imc createState() => _Imc();
}

class _Imc extends State<Imc> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Cálculo IMC'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(

        child:
        SingleChildScrollView (
          child:
            Padding(
              padding: const EdgeInsets.all(16.0),

            child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              const Text(
                'Calculadora de IMC',
              ),

              SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerPeso,
                decoration: const InputDecoration(
                    labelText: 'Peso',
                    hintText: 'Digite seu peso',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),

              SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: controllerAltura,
                decoration: const InputDecoration(
                    labelText: 'Altura',
                    hintText: 'Digite sua altura',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),

              SizedBox(height: 32),

              Container(
                alignment: Alignment.center,
                width: 300,
                child: Text(
                  resultadoImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ),


              SizedBox(height: 32),

              Container(
                width: 500,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.deepPurple[50],
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      num numAux = (num.parse(controllerPeso.text) / (num.parse(controllerAltura.text) * num.parse(controllerAltura.text)));
                      if (numAux < 18.5) {
                        resultadoImc = 'Você está abaixo do peso normal! \n ${numAux.toStringAsFixed(2)}';
                      } else  if (numAux < 24.9) {
                        resultadoImc = 'Seu peso é normal! \n ${numAux.toStringAsFixed(2)}';
                      } else  if (numAux < 29.9) {
                        resultadoImc = 'Você com excesso de peso" \n ${numAux.toStringAsFixed(2)}';
                      } else  if (numAux < 34.9) {
                        resultadoImc = 'Você com Obesidade Classe I" \n ${numAux.toStringAsFixed(2)}';
                      } else  if (numAux < 39.9) {
                        resultadoImc = 'Você com Obesidade Classe II" \n ${numAux.toStringAsFixed(2)}';
                      } else  if (numAux >= 40) {
                        resultadoImc = 'Você com Obesidade Classe III" \n ${numAux.toStringAsFixed(2)}';
                      } else {
                        resultadoImc = 'Resultado indefinido, verifique os campos e tente novamente!';
                      }
                      //resultadoImc = numAux.toStringAsFixed(2);
                    });
                  },
                  child: const Text('Calcular'),
                ),
              ),

              Container(
                width: 500,
                child: FilledButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.deepPurple[50],
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        )
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MyHomePage(title: 'Página Inicial')),
                      );
                    },
                    child: const Text('Voltar')),
              ),

            ],
          ),
        ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            resultadoImc = '';
          });
        },
        tooltip: 'Increment',
      ),
    );
  }
}