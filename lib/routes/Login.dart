// ignore_for_file: prefer_const_constructors

import 'package:flexx/controllers/LoadingController.dart';
import 'package:flexx/routes/RecoveryAcess.dart';
import 'package:flexx/routes/Register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../forms/Forms.dart';
import '../forms/ActionButtons.dart';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
        size: 140,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index.isEven
                  ? const Color.fromARGB(255, 62, 9, 160)
                  : const Color.fromARGB(255, 173, 53, 16),
            ),
          );
        });
  }
}

class _LoginPageState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

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
              ).animate()
              .moveY(begin: 155, end: 0, curve: Curves.easeInOut, duration: Duration(milliseconds: 1500))
              // .fade(delay: Duration(seconds: 2))
              ,
              Column(children: [
                Editor.texto('CPF/CNPJ', '000.000.000-00', documentCtrl,
                    Icons.account_circle, "###.###.###-##"),
                Editor.senha('Senha', '', passwordCtlr, Icons.password, null),
                ActionButtonEntrarWidget(
                    documentCtrl: documentCtrl, passwordCtlr: passwordCtlr),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor:
                          const Color.fromARGB(255, 255, 255, 255)),
                  onPressed: () {
                    Future<ListaTransferencias?> future = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Register();
                      }),
                    );
                    debugPrint('Primeiro Acesso');
                  },
                  child: Text('Primeiro Acesso'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor:
                          const Color.fromARGB(255, 255, 255, 255)),
                  onPressed: () {
                    Future<ListaTransferencias?> future = Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return RecoveryAcess();
                      }),
                    );
                    debugPrint('Recuperar Acesso');
                  },
                  child: Text('Recuperar Acesso'),
                )
              ])
              .animate()
              .show(duration: Duration(seconds: 2))
              .then().fadeIn(duration: Duration(seconds: 2))
           
              
            ])));
  }
}
