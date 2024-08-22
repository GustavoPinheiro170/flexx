import 'package:flexx/forms/ActionButtons.dart';
import 'package:flexx/forms/Forms.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController documento = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController nomeCompleto = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController tipoDocumento = TextEditingController();
  final TextEditingController numeroCelular = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cadastre-se'),
      ),
      body: Material(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Editor.numero("CPF / CNPJ", "000.000.000-00", documento,
                  Icons.perm_identity, "###.###.###-##"),
              Editor.senha("Senha", "", senha, Icons.password, null),
              Editor.texto("Nome Completo", "José Da Silva", nomeCompleto,
                  Icons.text_format, null),
              Editor.texto(
                  "E-mail", "jose@gmail.com", email, Icons.email, null),
              Editor.numero("Telefone", "(00) 00000-0000", numeroCelular,
                  Icons.phone_android, "(##) #####-####"),
              ActionButtonCadastrarWidget(
                documento: documento,
                senha: senha,
                nomeCompleto: nomeCompleto,
                email: email,
                tipoDocumento: tipoDocumento,
                numeroCelular: numeroCelular,
              )
            ],
          ),
        ),
      ),
    );
  }
}
