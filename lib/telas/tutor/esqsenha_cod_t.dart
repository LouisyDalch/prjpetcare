import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/repetidos/background.dart';

class EsqSenhaCodRecT extends StatefulWidget {
  const EsqSenhaCodRecT({super.key});

  @override
  State<EsqSenhaCodRecT> createState() => _EsqSenhaCodRecTState();
}

class _EsqSenhaCodRecTState extends State<EsqSenhaCodRecT> {
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            WidBackground(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Código de',
                    style: TextStyle(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Text(
                    'Recuperação',
                    style: TextStyle(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                  const Text(
                    'Mandamos um código de segurança para\n o email inserido anteriormente.\n Verifique-o e insira o código na caixa de texto\n abaixo, para que possamos confirmar\n sua identidade!',
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.025)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Form(
                      child: TextFormField(
                          onChanged: (Text) {
                            Text = email;
                          },
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: '127654',
                            border: OutlineInputBorder(),
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushReplacementNamed('/esqsenha_email_t'),
                        child: Text(
                          'Reenviar código',
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.13)),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.025)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.057,
                    child: ElevatedButton(
                      onPressed: () {
                        //programação -> tem q mandar código p email
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Color.fromRGBO(7, 88, 20, 1)))),
                      child: const Text(
                        'Confirmar',
                        style: TextStyle(
                            fontSize: 19, color: Color.fromRGBO(7, 88, 20, 1)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
