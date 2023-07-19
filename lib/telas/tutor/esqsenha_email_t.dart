import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/repetidos/background.dart';

class EsqueciSenhaEmail extends StatefulWidget {
  const EsqueciSenhaEmail({super.key});

  @override
  State<EsqueciSenhaEmail> createState() => _EsqueciSenhaEmailState();
}

class _EsqueciSenhaEmailState extends State<EsqueciSenhaEmail> {
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
                    'Esqueci Minha',
                    style: TextStyle(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Text(
                    'Senha',
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
                    'Digite o e-mail cadastrado para que\n possamos enviar as informações\n necessárias para recuperar sua conta.',
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
                          autocorrect: false,
                          decoration: const InputDecoration(
                              hintText: 'ememplo@gmail.com',
                              border: OutlineInputBorder())),
                    ),
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
                        'Entrar',
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
