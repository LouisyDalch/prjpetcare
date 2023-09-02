import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

class EditarAgenda_C extends StatefulWidget {
  const EditarAgenda_C({super.key});

  @override
  State<EditarAgenda_C> createState() => _EditarAgenda_CState();
}

class _EditarAgenda_CState extends State<EditarAgenda_C> {
  bool sab = false;
  bool seg = false;
  bool ter = false;
  bool qua = false;
  bool qui = false;
  bool sex = false;
  bool dom = false;

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
                Text(
                  "Agenda",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontFamily: "LilitaOne",
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  "Preencha os dias em que você\n estará disponível para a prestação\n de serviços.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Text(
                      "Domingo",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Checkbox(
                      value: dom,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          dom = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Segunda-feira",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Checkbox(
                      value: seg,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          seg = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Terça-feira",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Checkbox(
                      value: ter,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          ter = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Quarta-feira",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Checkbox(
                      value: qua,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          qua = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Quinta-feira",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Checkbox(
                      value: qui,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          qui = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Sexta-feira",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                    ),
                    Checkbox(
                      value: sex,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Sábado",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.14,
                    ),
                    Checkbox(
                      value: sab,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          sab = value!;
                        });
                      },
                    )
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      //programação
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(219, 114, 38, 1)),
                    child: Text(
                      'Salvar Alterações',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
