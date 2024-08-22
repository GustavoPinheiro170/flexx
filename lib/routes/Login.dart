// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../forms/Forms.dart';
import '../forms/ActionButtons.dart';
import '../main.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController documentCtrl = TextEditingController();
    final TextEditingController passwordCtlr = TextEditingController();

    return Material(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                width: 200,
                'images/abracor.png',
              ),
              Editor.texto(
                'CPF/CNPJ',
                '000.000.000-00',
                documentCtrl,
                Icons.account_circle,
              ),
              Editor.senha(
                'Senha',
                '#####',
                passwordCtlr,
                Icons.password,
              ),
              ActionButtonEntrarWidget(
                  documentCtrl: documentCtrl, passwordCtlr: passwordCtlr),
              TextButton(
                style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
                onPressed: () {
                  Future<ListaTransferencias?> future = Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return FormularioCadastro();
                    }),
                  );
                  debugPrint('Primeiro Acesso');
                },
                child: Text('Primeiro Acesso'),
              )
            ])));
  }
}
