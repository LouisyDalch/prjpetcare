import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/repetidos/background.dart';
import 'package:prjpetcare/repetidos/design.dart';

class EsqueceuSenhaY_Alterar extends StatefulWidget {
  const EsqueceuSenhaY_Alterar({super.key});

  @override
  State<EsqueceuSenhaY_Alterar> createState() => _EsqueceuSenhaY_AlterarState();
}

class _EsqueceuSenhaY_AlterarState extends State<EsqueceuSenhaY_Alterar> {
  String senha = "";
  String confsenha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recuperação de',
                style: TextStyle(
                    color: const Color.fromRGBO(219, 114, 38, 1),
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w300,
                    fontSize: MediaQuery.of(context).size.height * 0.04),
              ),
              Text(
                'Senha',
                style: TextStyle(
                    color: const Color.fromRGBO(219, 114, 38, 1),
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
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        Text = senha;
                      },
                      autocorrect: false,
                      obscureText: true,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: '********',
                          labelText: 'Nova Senha',
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
                        Text = senha;
                      },
                      autocorrect: false,
                      obscureText: true,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: '********',
                          labelText: 'Confirme a Senha',
                          border: OutlineInputBorder())),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.025)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    //programação -> verificar se o conteudo
                    //é igual nas duas caixas e mandar p BD
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                              color: Color.fromRGBO(219, 114, 38, 1)))),
                  child: const Text(
                    'Alterar Senha',
                    style: TextStyle(
                        fontSize: 19, color: Color.fromRGBO(219, 114, 38, 1)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
