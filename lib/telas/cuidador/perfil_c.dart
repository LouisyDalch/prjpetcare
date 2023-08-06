import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

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
                      image: const DecorationImage(
                          image: AssetImage("defora/imagens/fundoperfilC.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Configurações',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.009)),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.width * 0.005,
                  color: Colors.black,
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.015)),
                GestureDetector(
                  onTap: () => print("uiiii"), //programação
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(children: [
                      Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.height * 0.06,
                      ),
                      Text(
                        "Editar Perfil",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.0001,
                ),
                GestureDetector(
                  onTap: () => print("uiiii"), //programação
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(children: [
                      Icon(
                        Icons.calendar_month,
                        size: MediaQuery.of(context).size.height * 0.06,
                        weight: 200,
                      ),
                      Text(
                        "Editar Agenda",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.06)),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.height * 0.3)),
                    GestureDetector(
                      onTap: () => print("uiiii"), //programação
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: Row(children: [
                          Icon(
                            Icons.exit_to_app_rounded,
                            size: MediaQuery.of(context).size.height * 0.03,
                            weight: 200,
                          ),
                          Text(
                            "Sair",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
                MenuHorCuidador()
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Nome_cuidador",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Text("Idade",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                          //colocar imagem
                        ),
                      ),
                      Text("Localização",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Text("Email",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.516,
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}
