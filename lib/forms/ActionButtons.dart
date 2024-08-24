import 'dart:convert';
import 'dart:io';

import 'package:flexx/controllers/LoadingController.dart';
import 'package:flexx/http/HttpRequests.dart';
import 'package:flexx/models/UserDTO.dart';
import 'package:flexx/routes/Login.dart';
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

class ActionButtonRecuperarAcessoWidget extends StatelessWidget {
  final TextEditingController documento;

  final TextEditingController email;

  const ActionButtonRecuperarAcessoWidget(
      {super.key, required this.documento, required this.email});

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
      onPressed: () {},
      child: const Text('Recuperar'),
    );
  }
}
