import 'dart:convert';

import 'package:flexx/http/HttpRequests.dart';
import 'package:flexx/models/UserDTO.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8;

class ActionButtonEntrarWidget extends StatelessWidget {
  const ActionButtonEntrarWidget({
    super.key,
    required this.documentCtrl,
    required this.passwordCtlr,
  });

  final TextEditingController documentCtrl;
  final TextEditingController passwordCtlr;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180.0, 45.0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        debugPrint(
            'Entrar ${documentCtrl.value.text} | ${passwordCtlr.value.text}');

        FocusScope.of(context).unfocus();
      },
      child: const Text('Entrar'),
    );
  }
}

class ActionButtonCadastrarWidget extends StatelessWidget {
  final TextEditingController documento;

  final TextEditingController senha;
  final TextEditingController nomeCompleto;
  final TextEditingController email;
  final TextEditingController tipoDocumento;
  final TextEditingController numeroCelular;

  const ActionButtonCadastrarWidget(
      {super.key,
      required this.documento,
      required this.senha,
      required this.nomeCompleto,
      required this.email,
      required this.tipoDocumento,
      required this.numeroCelular});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(180.0, 45.0),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
        ),
      ),
      onPressed: () {
        //TODO converter em JSON e chamar API de Cadastro
        UserDTO user =
            UserDTO(nomeCompleto.text, documento.text, 'CPF', senha.text);
        debugPrint('${user.toJson()}');

        Future<http.Response> createUserRequest = HttpRequests.requestHttpPost(
            'http://192.168.1.23:8081/api/v1/flexx/user/register',
            jsonEncode(user.toJson()));

        //TODO CRIAR ALERT PERSONALIZADO E TRATAR MENSAGEM DE RETORNO DENTRO DE UM OBJETO
        createUserRequest
            .then((value) => {
                  if (value.statusCode != 200)
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AlertDialog(
                          title: Text('Erro ao solicitar cadastro!'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(utf8.decode(value.body.runes.toList())),
                                Text(
                                    'Por gentileza, verifique o dados e tente novamente!'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Approve'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }))
                    }
                })
            .catchError((err) => debugPrint(err));

        FocusScope.of(context).unfocus();
      },
      child: const Text('Cadastrar'),
    );
  }
}
