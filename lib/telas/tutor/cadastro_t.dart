import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

import '../../Elementos_design/design.dart';

class Cadastro_T extends StatefulWidget {
  const Cadastro_T({super.key});

  @override
  State<Cadastro_T> createState() => _Cadastro_TState();
}

class _Cadastro_TState extends State<Cadastro_T> {
  String nome = "";
  String email1 = "";
  String email2 = "";
  String senha1 = "";
  String senha2 = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Crie sua conta',
                  style: TextStyle(
                      color: const Color.fromRGBO(7, 88, 20, 1),
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w200,
                      fontSize: MediaQuery.of(context).size.height * 0.04),
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.01)),
                Text(
                  'Tutor PetCare',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.045,
                      decoration: TextDecoration.none,
                      color: const Color.fromRGBO(7, 88, 20, 1),
                      fontFamily: 'LilitaOne'),
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                Row(
                  children: [
                    Container(
                      color: const Color.fromRGBO(7, 88, 20, 1),
                      height: 8,
                      width: 8,
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.75,
                      color: const Color.fromRGBO(7, 88, 20, 1),
                    ),
                    Container(
                      color: const Color.fromRGBO(7, 88, 20, 1),
                      height: 8,
                      width: 8,
                    ),
                    
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        Text = nome;
                      },
                      autocorrect: false,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: '',
                          labelText: 'Nome completo',
                          border: OutlineInputBorder())),
                ),
              ),
              Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        Text = email1;
                      },
                      autocorrect: false,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: 'exemplo@gmail.com',
                          labelText: 'Email',
                          border: OutlineInputBorder())),
                ),
              ),
              Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        Text = email2;
                      },
                      autocorrect: false,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: 'exemplo@gmail.com',
                          labelText: 'Confirme o email',
                          border: OutlineInputBorder())),
                ),
              ),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
