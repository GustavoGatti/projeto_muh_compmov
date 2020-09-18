import 'package:flutter/material.dart';
import 'package:projeto_muh_compmov/Drawer/Drawer.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.black),
      //  leading: Image.asset("imagens/cow.png"),
      title: Image.asset("assets/vakinha.png", alignment: Alignment.center, scale: 3.5,),
      actions: [
        RaisedButton(
          // color: Colors.white,
          //padding: EdgeInsets.only(0.2),
          child:
          Icon(Icons.message),
          color: Colors.white,
          onPressed: () {
            // vai para as mensagens...
          },
        ),
      ],
    ),
      drawer: CustomDrawer(),
    );
  }
}


