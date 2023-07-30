import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

class Perfil_C extends StatefulWidget {
  const Perfil_C({super.key});

  @override
  State<Perfil_C> createState() => _Perfil_CState();
}

class _Perfil_CState extends State<Perfil_C> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("defora/imagens/fundoperfilC.png"),
                      fit: BoxFit.fill)
                  ),
                )
              ],

            ),
          ],
        )
      ]),
    );
  }
}