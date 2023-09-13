import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter/cupertino.dart';
import '../../Elementos_design/design.dart';

//programar p trazer os dados já cadastrados :)

class EditarPerfPet_T extends StatefulWidget {
  const EditarPerfPet_T({super.key});

  @override
  State<EditarPerfPet_T> createState() => _EditarPerfPet_TState();
}

class _EditarPerfPet_TState extends State<EditarPerfPet_T> {
  _EditarPerfPet_TState() {
    _genSelect = generos[2];
    _portSelect = portes[0];
    _vacSelect = vacinacao[3];
  }
  final generos = ["Feminino", "Masculino", "Desconhecido"];
  String? _genSelect = "";

  final portes = ["Pequeno", "Médio", "Grande"];
  String? _portSelect = "";

  final vacinacao = [
    "Possui todas as vacinas.",
    "Possui somente vacina antirrábica.",
    "Possui outras vacinas, menos a antirrábica.",
    "Não possui vacinas."
  ];
  String? _vacSelect = "";

  String nome = "";
  String dataNasce = "";
  String especie = "";
  double peso = 0.0;
  int vac = 3;
  String descr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const WidBackground(),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Stack(
                      children: [Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.17,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "defora/imagens/fundoperfpet_edt.png"),
                                fit: BoxFit.cover)),
                      ),
                      Row(
            
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.018,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.13,
                        decoration: BoxDecoration(
                            color: Colors.cyanAccent,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      GestureDetector(
                        onTap: () => print("aaa"),
                        child: Text(
                          "Adicionar Foto",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
                      ]
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              Text = nome;
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Nome/Apelido",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Text(
                          "Data de Nascimento",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        backgroundColor: Color.fromARGB(255, 235, 234, 234),
                        onDateTimeChanged: (DateTime value) {
                          String dia = "";
                          String mess = "";
                          final day = value.day;
                          final mes = value.month;
                          final ano = value.year;
                          if (day < 10) {
                            dia = "0$day";
                          } else {
                            dia = "$day";
                          }
                          if (mes < 10) {
                            mess = "0$mes";
                          } else {
                            mess = "$mes";
                          }
                          dataNasce = "$dia/$mess/$ano";
                          print(dataNasce);
                          // Do something
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              Text = especie;
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Espécie",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            onChanged: (Text) {
                              var amz = double.tryParse(Text);
                              amz = peso;
                            },
                            autocorrect: false,
                            keyboardType: TextInputType.number,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Peso (em kg)",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Gênero",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Text(
                          "Porte",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.28,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField(
                            value: _genSelect,
                            items: generos.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _genSelect = val as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromRGBO(8, 113, 26, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.07,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: DropdownButtonFormField(
                            value: _portSelect,
                            items: portes.map((e) {
                              return DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _portSelect = val as String;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromRGBO(8, 113, 26, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Text(
                          "Sobre a vacinação...",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: SingleChildScrollView(
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          value: _vacSelect,
                          items: vacinacao.map((e) {
                            return DropdownMenuItem(
                              child: Text(
                                e,
                                overflow: TextOverflow.ellipsis,
                              ),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _vacSelect = val as String;
                              if (_vacSelect == vacinacao[0] as String) {
                                vac = 0;
                              } else if (_vacSelect == vacinacao[1] as String) {
                                vac = 1;
                              } else if (_vacSelect == vacinacao[2] as String) {
                                vac = 2;
                              } else if (_vacSelect == vacinacao[3] as String) {
                                vac = 3;
                              }
                            });
                          },
                          icon: const Icon(
                            Icons.arrow_drop_down_circle,
                            color: Color.fromRGBO(8, 113, 26, 1),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.13,
                      width: MediaQuery.of(context).size.width * 0.85,
                      color: Colors.white,
                      child: Form(
                          child: Column(
                        children: [
                          TextFormField(
                            maxLines: 3,
                            onChanged: (Text) {
                              descr = Text;
                            },
                            autocorrect: false,
                            decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "Descrição/Observações",
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          //programação
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(60, 115, 56, 1),
                        ),
                        child: Text(
                          'Salvar Alterações',
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
