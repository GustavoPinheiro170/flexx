import 'package:flexx/forms/ActionButtons.dart';
import 'package:flexx/forms/Forms.dart';
import 'package:flutter/material.dart';

class RecoveryAcess extends StatelessWidget {
  const RecoveryAcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = new TextEditingController();
    TextEditingController documentNumber = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Recuperar Acesso'),
        ),
        body: Material(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Editor.texto(
                    "E-mail", "jose@gmail.com", email, Icons.email, null),
                Editor.texto('CPF/CNPJ', '000.000.000-00', documentNumber,
                    Icons.account_circle, "###.###.###-##"),
               ActionButtonRecuperarAcessoWidget(documento: documentNumber, email: email)

              ],
            ),
          ),
        )));
  }
}
