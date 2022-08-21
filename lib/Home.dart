import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "";
  TextEditingController _controllerId = TextEditingController();

  _recuperarDado() async {
    String idDigitado = _controllerId.text;
    String url = "http://10.0.0.103:4000/clientes/${idDigitado}";

    http.Response response;

    response = await http.get(Uri.parse(url));

    Map<String, dynamic> retorno = jsonDecode(response.body);
    String nome = retorno["nome"];
    String email = retorno["email"];
    String celular = retorno["celular"];

    return jsonDecode(response.body);
    /*setState(() {
      _resultado = nome + ", " + email + ", " + celular;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Consumo teste")),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text(_resultado),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Digite o id do cliente"),
              style: (TextStyle(fontSize: 20)),
              controller: _controllerId,
            ),
            ElevatedButton(
                child: Text('Clique aqui'),
                onPressed: () {
                  _recuperarDado();
                }),
          ],
        ),
      ),
    );
  }
}
