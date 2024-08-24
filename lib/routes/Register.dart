import 'dart:convert';

import 'package:flexx/controllers/LoadingController.dart';
import 'package:flexx/forms/ActionButtons.dart';
import 'package:flexx/forms/Forms.dart';
import 'package:flexx/http/HttpRequests.dart';
import 'package:flexx/models/RegisterResponse.dart';
import 'package:flexx/models/UserDTO.dart';
import 'package:flexx/routes/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  RegisterState createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final TextEditingController documento = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController nomeCompleto = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController tipoDocumento = TextEditingController();
  final TextEditingController creci = TextEditingController();
  final TextEditingController numeroCelular = TextEditingController();
  Future<dynamic>? createUserRequest;
  ScrollController controller = ScrollController();
  bool isError = false;
  bool isLoading  = false;
  void stateAlert(bool stateError) {
    setState(() {
      isLoading = false;
      isError = stateError;
    });
  }

  @override
  Widget build(BuildContext context) {
    void initState() {
      super.initState();
    }


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Cadastre-se'),
      ),
      body: Material(
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/background.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              controller: controller,
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
                  Editor.numero("Creci", "UF/1234-J", creci,
                      Icons.document_scanner, "AA/####-A"),
                  ElevatedButton(
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
                    onPressed: () async {
                      //TODO converter em JSON e chamar API de Cadastro
                      UserDTO user = UserDTO(
                          email.text,
                          senha.text,
                          documento.text,
                          creci.text,
                          nomeCompleto.text,
                          "USER",
                          this.numeroCelular.text);
                      debugPrint('${user.toJson()}');

                      isLoading = true;
                      Future<http.Response> createUserRequest = 
                          HttpRequests.requestHttpPost(
                              'http://192.168.0.107:8443/api/v1/orion/auth/register',
                              jsonEncode(user.toJson()));

                      createUserRequest.then((value) => {
                                if (value.statusCode != 200){
                                   stateAlert(true),
                                           
                                  _dialogBuilder(context)
                                } else {
                                  stateAlert(false),
                                  _dialogBuilder(context)
                          }})
                          .catchError((err) => debugPrint(err.toString()));
                      FocusScope.of(context).unfocus();
           
                    },
              
                    child: const Text('Cadastrar'),
                  ),
                Container(
                  width: 100,
                  height: 20,
                  margin: EdgeInsets.all(2.0),
                ),
                buildLoading(context),
                ],
                
              ),
            )),
      ),
    );
  }

Widget buildLoading(BuildContext context) {
  return isLoading ?  SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? const Color.fromARGB(255, 182, 19, 8) : const Color.fromARGB(255, 33, 3, 80),
            
          ),
          
        );
      },
    ) : Container();
}
  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: isError
              ? const Text('Erro ao registrar-se')
              : const Text('Cadastro realizado!'),
          content: isError
              ? const Text(
                  'Por gentileza, verifique o dados e tente novamente!')
              : const Text('Utilize seus dados para realizar o Login'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                isError ?
                Navigator.of(context).pop() : 
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
              },
            ),
          ],
        );
      },
    );
  }

  Widget buildFutureSpinner(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: createUserRequest,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }
        return Container();
      },
    );
  }
}
