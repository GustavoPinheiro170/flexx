// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:masked_text/masked_text.dart';
import '../forms/ActionButtons.dart';

class Editor extends StatelessWidget {
  String? title;
  String? tip;
  String? mask;
  TextEditingController? controller;
  IconData? icon;
  bool isPassword = false;
  bool isTextFiled = true;

  Editor.numero(this.title, this.tip, this.controller, this.icon, this.mask, {super.key}) {
    isPassword = false;
    isTextFiled = false;
  }

  Editor.texto(this.title, this.tip, this.controller, this.icon, this.mask, {super.key}) {
    isPassword = false;
    isTextFiled = true;
  }

  Editor.senha(this.title, this.tip, this.controller, this.icon, this.mask, {super.key}) {
    isPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22.0),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        inputFormatters: [MaskTextInputFormatter(
          mask: mask,
          type: MaskAutoCompletionType.lazy

        )],
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(
            icon,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          labelText: title,
          labelStyle: TextStyle(color: Colors.white),
          hintText: tip,
          hintStyle: TextStyle(color: Colors.white),
          floatingLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        keyboardType: isTextFiled ? TextInputType.text : TextInputType.number,
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controladorNumeroConta = TextEditingController();
  final TextEditingController controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de transferências!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor.texto("Número da Conta", "0000", controladorNumeroConta,
                Icons.numbers, null),
            Editor.texto("Valor da Transferência", "R\$ 200.00",
                controladorValor, Icons.monetization_on, null),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                debugPrint(controladorNumeroConta.text);
                debugPrint(controladorValor.text);
                final int? numeroConta =
                    int.tryParse(controladorNumeroConta.text);
                final int? valorTransf = int.tryParse(controladorValor.text);
                try {
                  if (numeroConta != null && valorTransf != null) {
                    Transferencia transferenciaCriada =
                        Transferencia(numeroConta, valorTransf);
                    Navigator.pop(context, transferenciaCriada);
                  } else {
                    throw Exception("Valores de referência invalidos");
                  }
                } on Exception catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Text('Adicionar'),
            ),

            //const Aviso(),
          ],
        ),
      ),
    );
  }
}

class Transferencia extends StatelessWidget {
  final int? numeroConta;
  final int? valor;

  const Transferencia(this.numeroConta, this.valor, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      child: ListTile(
        title: Text(
          numeroConta.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const Icon(
          Icons.monetization_on,
        ),
        subtitle: Text('R\$$valor'),
      ),
    );
  }
}

