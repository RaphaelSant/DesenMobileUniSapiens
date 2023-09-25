import 'package:flutter/material.dart';

import '../main.dart';

class Cadastro extends StatefulWidget {
  @override
  _Cadastro createState() => _Cadastro();
}

const List<String> list = <String>['Analista de Sistemas', 'Recursos Humanos', 'Vendas', 'Serviços Gerais'];

class _Cadastro extends State<Cadastro> {

  bool? isCheckedFem = false;
  bool? isCheckedMasc = false;

  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Funcionários'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:

      SingleChildScrollView (

        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              SizedBox(height: 16),

              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Nome',
                    hintText: 'Digite seu nome completo',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),

              SizedBox(height: 16),

              Text(
                  "Sexo",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left
              ),

              CheckboxListTile(
                title: Text("Feminino"),
                value: isCheckedFem,
                onChanged: (newBool) {
                  setState(() {
                    if (isCheckedMasc == true) {
                      isCheckedMasc = false;
                      isCheckedFem = newBool;
                    } else {
                      isCheckedFem = newBool;
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),

              CheckboxListTile(
                title: Text("Masculino"),
                value: isCheckedMasc,
                onChanged: (newBool) {
                  setState(() {
                    if (isCheckedFem == true) {
                      isCheckedFem = false;
                      isCheckedMasc = newBool;
                    } else {
                      isCheckedMasc = newBool;
                    }
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),

              SizedBox(height: 16),

              Text(
                  "Área de Atuação",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left
              ),

              SizedBox(height: 10),

              DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),

              SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'CPF',
                    hintText: 'Digite o CPF',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),

              SizedBox(height: 16),

              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Valor do Salário',
                    hintText: 'Digite o Salário',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                    )
                ),
              ),

              SizedBox(height: 16),

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
                      //resultadoImc = numAux.toStringAsFixed(2);
                    });
                  },
                  child: const Text('Cadastrar'),
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
    );
  }
}