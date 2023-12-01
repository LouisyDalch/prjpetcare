import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

import '../../Elementos_design/design.dart';

class MeuHist_T extends StatefulWidget {
  const MeuHist_T({super.key});

  @override
  State<MeuHist_T> createState() => _MeuHist_TState();
}

class _MeuHist_TState extends State<MeuHist_T> {
  Widget _btnAndamento() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/serv_solic_t');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(81, 156, 93, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Solicitações',
          style: TextStyle(
            fontSize: 19, color: Color.fromRGBO(20, 20, 20, 1)),
        ),
      ),
    );
  }

  Widget _btnFinalizado() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/serv_final_t');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(61, 91, 31, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Finalizados',
          style: TextStyle(
            fontSize: 19, color: Color.fromRGBO(20, 20, 20, 1)),
        ),
      ),
    );
  }


  Widget _btnConfirmados() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/serv_confirm_t');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(94, 144, 64, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Confirmados',
          style: TextStyle(
            fontSize: 19, color: Color.fromRGBO(20, 20, 20, 1)
            ),
        ),
      ),
    );
  }


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
             Text("Meu Histórico",
             style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontFamily: "LilitaOne"
             ),),
             Container(
              height: MediaQuery.of(context).size.height * 0.08,
             ),
             Container(
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 141, 141, 141).withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: 
             
             Column(children: [
              Container(
              height: MediaQuery.of(context).size.height * 0.02,
             ),
              Row(
               children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.05,
                 ),
                 Text("Serviços", 
                 style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.bold
                 ),),
                 Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                 )
               ],
             ),
             Container(
              height: MediaQuery.of(context).size.height * 0.04,
             ),
             _btnAndamento(),
             Container(
              height: MediaQuery.of(context).size.height * 0.04,
             ),
             _btnConfirmados(),
             Container(
              height: MediaQuery.of(context).size.height * 0.04,
             ),
             _btnFinalizado(),
             Container(
              height: MediaQuery.of(context).size.height * 0.04,
             ),
             ],),),
             
             Container(
              height: MediaQuery.of(context).size.height * 0.17,
             ),
            MenuHorTutor()
            ],),
          ],
        )
      ]),
    );
  }
}