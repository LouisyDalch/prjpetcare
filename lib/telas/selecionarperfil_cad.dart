import 'package:flutter/material.dart';

import '../Elementos_design/background.dart';

class EscolherPerfilCad extends StatefulWidget {
  const EscolherPerfilCad({super.key});

  @override
  State<EscolherPerfilCad> createState() => _EscolherPerfilCadState();
}

class _EscolherPerfilCadState extends State<EscolherPerfilCad> {
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
                        //programação
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
                        Navigator.of(context).pushNamed('/criarcontacuidador');
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
