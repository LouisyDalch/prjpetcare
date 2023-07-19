import 'package:flutter/material.dart';
import 'package:prjpetcare/repetidos/background.dart';

class EscolherPerfil extends StatefulWidget {
  const EscolherPerfil({super.key});

  @override
  State<EscolherPerfil> createState() => _EscolherPerfilState();
}

class _EscolherPerfilState extends State<EscolherPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          const WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/entrartutor');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Text(
                        'Tutor PetCare',
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: const Color.fromRGBO(7, 88, 20, 1)),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.18)),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/entrarcuidador');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Text(
                        'Cuidador PetCare',
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: const Color.fromRGBO(219, 114, 38, 1)),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
