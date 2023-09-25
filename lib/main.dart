import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/cadastro.dart';
import 'package:flutter_app/Pages/imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Atividade Avaliativa UniSapiens'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  perfilCirculo() {
    return Center(
      child : new Container(
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://i.pinimg.com/originals/a4/84/00/a484000dcbc5600c92009066220387ec.jpg")
            )
        ),
      ),

    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            perfilCirculo(), // Imagem de perfil

            SizedBox(height: 35,),

            const Text('Aluno: Raphael Moura Santiago'),
            const Text('RA: 2011391'),

            SizedBox(height: 35,),

            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  FilledButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurple[50],
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Imc())
                        );
                      },
                      child: const Text('IMC')),

                  SizedBox(width: 20,),

                  FilledButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.deepPurple[50],
                          backgroundColor: Colors.deepPurpleAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          )
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Cadastro()),
                        );
                      },
                      child: const Text('Cadastro')),

                ]
            ),

          ],
        ),
      ),
    );
  }
}
