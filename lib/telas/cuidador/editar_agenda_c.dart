import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

import '../../API/cuidadoresmet.dart';

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

  int sab1 = 0;
  int seg1 = 0;
  int ter1 = 0;
  int qua1 = 0;
  int qui1 = 0;
  int sex1 = 0;
  int dom1 = 0;

  @override
  void initState() {
    super.initState();
    loadAgenda();
  }

  CuidadorRepository cuidadorRepository = CuidadorRepository();
  Future<ListResult> getAgenda() async {
    return await cuidadorRepository.puxarDias();
  }

  void iniciar() {
    if (dom1 == 1) {
      dom = true;
    }
    if (seg1 == 1) {
      seg = true;
    }
    if (ter1 == 1) {
      ter = true;
    }
    if (qua1 == 1) {
      qua = true;
    }
    if (qui1 == 1) {
      qui = true;
    }
    if (sex1 == 1) {
      sex = true;
    }
    if (sab1 == 1) {
      sab = true;
    }
  }

  List<Dias> lstDias = [];

  void loadAgenda() async {
    ListResult agenda = await getAgenda();
    setState(() {
      lstDias = [];
      for (var element in agenda.resultados) {
        lstDias.add(Dias(
            idAgenda: element["idAgenda"],
            dom: element["dom"],
            seg: element["seg"],
            ter: element["ter"],
            qua: element["qua"],
            qui: element["qui"],
            sex: element["sex"],
            sab: element["sab"]));
      }
      print(lstDias);
      Dias a = lstDias[0];
      dom1 = a.dom;
      seg1 = a.seg;
      ter1 = a.ter;
      qua1 = a.qua;
      qui1 = a.qui;
      sex1 = a.sex;
      sab1 = a.sab;
      iniciar();
    });
  }

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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (dom != value) {
                            dom1 = 1;
                          } else {
                            dom1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                    Checkbox(
                      value: seg,
                      activeColor: const Color.fromRGBO(219, 114, 38, 1),
                      onChanged: (bool? value) {
                        setState(() {
                          seg = value!;
                          if (seg == true) {
                            seg1 = 1;
                          } else {
                            seg1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (ter == true) {
                            ter1 = 1;
                          } else {
                            ter1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (qua == true) {
                            qua1 = 1;
                          } else {
                            qua1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (qui == true) {
                            qui1 = 1;
                          } else {
                            qui1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (sex == true) {
                            sex1 = 1;
                          } else {
                            sex1 = 0;
                          }
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
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.bold),
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
                          if (sab == true) {
                            sab1 = 1;
                          } else {
                            sab1 = 0;
                          }
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
                      iniciar();
                      Future<ServiceResult> agenda =
                          cuidadorRepository.atualizarAgenda(
                              dom1, seg1, ter1, qua1, qui1, sex1, sab1);

                      var snackBar = const SnackBar(
                          content: Text(
                        "Agenda atualizada",
                        style: TextStyle(fontSize: 15),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
