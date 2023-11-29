import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

import '../../Elementos_design/background.dart';

class LogadoTutor extends StatefulWidget {
  const LogadoTutor({super.key});

  @override
  State<LogadoTutor> createState() => _LogadoTutorState();
}

class _LogadoTutorState extends State<LogadoTutor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const WidBackground(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'O que você deseja hoje?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.055),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.003)),
                    Icon(
                      Icons.pets,
                      size: MediaQuery.of(context).size.width * 0.05,
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                _btnHosp(),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                _btnCreche(),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                _btnPetSitter(),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                _btnPasseio(),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.02)),
                _btnAdestramento(),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.03)),
                MenuHorTutor()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _btnHosp() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(61, 91, 31, 1),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/mostrar_hosp_t'),
        child: Row(children: [
          Image.asset('defora/imagens/coelho.png'),
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.005)),
          Text(
            'HOSPEDAGEM',
            style: TextStyle(
                fontFamily: 'LilitaOne',
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white),
            textAlign: TextAlign.right,
          )
        ]),
      ),
    );
  }

  Widget _btnCreche() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(94, 144, 64, 1),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/mostrar_creche_t'),
        child: Row(children: [
          Image.asset('defora/imagens/passarinho.png'),
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.00002)),
          Text(
            'CRECHE',
            style: TextStyle(
                fontFamily: 'LilitaOne',
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white),
            textAlign: TextAlign.right,
          )
        ]),
      ),
    );
  }

  Widget _btnPetSitter() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(81, 156, 93, 1),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/mostrar_sitter_t'),
        child: Row(children: [
          Image.asset('defora/imagens/peixe.png'),
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.005)),
          Text(
            'PET SITTER',
            style: TextStyle(
                fontFamily: 'LilitaOne',
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white),
            textAlign: TextAlign.right,
          )
        ]),
      ),
    );
  }

  Widget _btnPasseio() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(94, 144, 64, 1),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/mostrar_pass_t'),
        child: Row(children: [
          Image.asset('defora/imagens/cachorro.png'),
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.005)),
          Text(
            'PASSEIOS',
            style: TextStyle(
                fontFamily: 'LilitaOne',
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white),
            textAlign: TextAlign.right,
          )
        ]),
      ),
    );
  }

  Widget _btnAdestramento() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(81, 156, 93, 1),
          borderRadius: BorderRadius.circular(20)),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed('/mostrar_adestra_t'),
        child: Row(children: [
          Image.asset('defora/imagens/gato.png'),
          Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.0002)),
          Text(
            'ADESTRAMENTO',
            style: TextStyle(
                fontFamily: 'LilitaOne',
                fontSize: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white),
            textAlign: TextAlign.right,
          )
        ]),
      ),
    );
  }

 
}
