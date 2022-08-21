import 'package:consumo_servicos/Cliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FutureTeste extends StatefulWidget {
  const FutureTeste({Key? key}) : super(key: key);

  @override
  State<FutureTeste> createState() => _FutureTesteState();
}

class _FutureTesteState extends State<FutureTeste> {
  String _resultado = "";
  TextEditingController _controllerId = TextEditingController();

  Future<List<Cliente>> _recuperarDado() async {
    //String idDigitado = _controllerId.text;
    String url = "http://10.0.0.103:4000";

    http.Response response;

    response = await http.get(Uri.parse(url + "/clientes"));
    var dadosJson = jsonDecode(response.body);

    List<Cliente> clientes = [];
    for (var cliente in dadosJson) {
      Cliente c = Cliente(
          cliente["id"], cliente["nome"], cliente["email"], cliente["celular"]);
      clientes.add(c);
    }
    return clientes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Teste consumo api")),
      body: FutureBuilder<List<Cliente>>(
        future: _recuperarDado(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                color: Colors.purple,
                strokeWidth: 5,
              ));
            case ConnectionState.done:
              if (snapshot.hasError) {
                print("Erro ao carregar dados");
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    List<Cliente>? lista = snapshot.data;
                    Cliente cliente = lista![index];
                    return ListTile(
                      title: Text(cliente.nome),
                      subtitle: Text(cliente.email),
                    );
                  },
                );
              }
              break;
            default:
              break;
          }
          return Text("Teste feito");
        },
      ),
    );
  }
}
