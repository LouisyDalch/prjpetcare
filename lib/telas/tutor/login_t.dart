import 'package:flutter/material.dart';

import '../../repetidos/background.dart';

class WidEntrarTutor extends StatefulWidget {
  const WidEntrarTutor({super.key});

  @override
  State<StatefulWidget> createState() {
    return WidEntrarTutorState();
  }
}

class WidEntrarTutorState extends State<WidEntrarTutor> {
  String emailusu = '';
  String senha = '';

  Widget _btnEntrar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.057,
      child: ElevatedButton(
        onPressed: () {
          //programação
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Entrar',
          style:
              TextStyle(fontSize: 19, color: Color.fromRGBO(7, 88, 20, 1)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              const WidBackground(),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BEM-VINDO',
                          style: TextStyle(
                              color: const Color.fromRGBO(7, 88, 20, 1),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w200,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01)),
                        Text(
                          'Tutor PetCare',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.045,
                              decoration: TextDecoration.none,
                              color: const Color.fromRGBO(7, 88, 20, 1),
                              fontFamily: 'LilitaOne'),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.03)),
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
                                MediaQuery.of(context).size.height * 0.03)),
                        Container(
                            //email/usuario
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              onChanged: (Text) {
                                emailusu = Text;
                              },
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                              decoration: InputDecoration(
                                  labelText: 'Email ou usuário',
                                  labelStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  border: const OutlineInputBorder()),
                            )),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.03)),
                        Container(
                            //senha
                            color: Colors.white,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: TextField(
                              onChanged: (Text) {
                                senha = Text;
                              },
                              obscureText: true,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.02),
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02),
                                  border: const OutlineInputBorder()),
                            )),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.008)),
                        Text(
                          'Esqueci minha senha',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.03)),
                        _btnEntrar()
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
