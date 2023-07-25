import 'package:flutter/material.dart';

import '../../Elementos_design/background.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({super.key});

  @override
  State<CriarConta> createState() {
    return _CriarContaState();
  }
}

class _CriarContaState extends State<CriarConta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const WidBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w200,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01)),
                  Text(
                    'Cuidador PetCare',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.045,
                        decoration: TextDecoration.none,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        fontFamily: 'LilitaOne'),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                  Column(
                    children: [
                      RichText(
                        text: const TextSpan(
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(text: "\r Devido a "),
                              TextSpan(
                                text:
                                    "Política de Segurança ", //isso vai ter q se tornar clicável dps
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                  text:
                                      "do \n aplicativo PetCare, o cadastro do \n Cuidador é realizado pela Web. \n\r Ao enviá-lo, ele será avaliado pelo \n nosso time de especialistas e se \n aprovado, o aplicativo será liberado."),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.03)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: ElevatedButton(
                          onPressed: () {
                            //programação
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              padding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.025),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(
                                      color: Color.fromRGBO(219, 114, 38, 1)))),
                          child: Text(
                            'Cadastrar-se',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: const Color.fromRGBO(219, 114, 38, 1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.06)),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.5),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.033),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      "\r O liberamento do aplicativo é realizado em \n até 7 dias úteis. \n\r Caso o aplicativo não esteja liberado, entre \n em contato com a nossa Central de \n Atendimento. \n SAC: 0800 123 4567  "),
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
