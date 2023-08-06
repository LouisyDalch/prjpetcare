import 'package:flutter/material.dart';
import 'package:prjpetcare/API/cuidadoresmet.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

import '../../Elementos_design/background.dart';

class WidEntrarCuidador extends StatefulWidget {
  const WidEntrarCuidador({super.key});

  @override
  State<StatefulWidget> createState() {
    return WidEntrarCuidadorState();
  }
}

class WidEntrarCuidadorState extends State<WidEntrarCuidador> {
  String emailusu = '';
  String senha = '';
  CuidadorRepository cuidadorRepository = CuidadorRepository();

  Widget _btnEntrar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.057,
      child: ElevatedButton(
        onPressed: () async {
          LoginResult result =
              await cuidadorRepository.loginCuidadores(emailusu, senha);

          if (emailusu == "" || senha == "") {
            var snackBar = const SnackBar(content: Text(
              "Preencha todos os campos!",style: TextStyle(fontSize: 15),
            ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            if (senha.length > 10) {
              var snackBar = const SnackBar(content: Text(
                "A senha pode conter apenas até 10 caracteres.",
                style: TextStyle(fontSize: 15),
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              if (result.success) {
                CuidadorRepository.token = result.token;
                Navigator.pushReplacementNamed(context, '/logadocuidador');
              } else {
                var snackBar = const SnackBar(content: Text(
                  "Email ou senha incorretos.",style: TextStyle(fontSize: 15),
                ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side:
                    const BorderSide(color: Color.fromRGBO(219, 114, 38, 1)))),
        child: const Text(
          'Entrar',
          style:
              TextStyle(fontSize: 19, color: Color.fromRGBO(219, 114, 38, 1)),
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
                              color: const Color.fromRGBO(219, 114, 38, 1),
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w200,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.04),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01)),
                        Text(
                          'Cuidador PetCare',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.045,
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
