import 'package:flutter/material.dart';

import 'forms/Forms.dart';
import 'routes/Login.dart';

void main() {
  runApp(const AbracorApp());
}

class AbracorApp extends StatelessWidget {
  const AbracorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Login(),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget implements PreferredSize {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        style: TextStyle(color: Color.fromARGB(255, 15, 13, 13)),
        "Abracor",
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  // TODO: implement preferredSize
  Size get preferredSize  => const Size.fromHeight(60);
}

class ListaTransferencias extends StatefulWidget {
  List<Transferencia?> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

class ListaTranferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, idx) {
          final transferencia = widget._transferencias[idx];
          return Transferencia(
              transferencia?.numeroConta, transferencia?.valor);
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          style: TextStyle(color: Colors.white),
          "Flexx - Encomendas Rápidas",
          textDirection: TextDirection.ltr,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return FormularioTransferencia();
            }),
          );
          future.then((transferenciaRecebida) {
            setState(() {
              if(transferenciaRecebida != null ){
              widget._transferencias.add(transferenciaRecebida);
              }
            });
          });
        },
      ),
    );
  }
}
