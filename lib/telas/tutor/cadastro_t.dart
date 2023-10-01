import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/API/tutoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../Elementos_design/design.dart';

class Cadastro_T extends StatefulWidget {
  const Cadastro_T({super.key});

  @override
  State<Cadastro_T> createState() => _Cadastro_TState(0);
}

class _Cadastro_TState extends State<Cadastro_T> {
  TutorRopository tutorRopository = new TutorRopository();
  String nome = "";
  String email1 = "";
  String email2 = "";
  String senha1 = "";
  String senha2 = "";
  String dataNasce = "";
  DateTime data = DateTime.now();
  String datta = "";
  String cpf = "";
  String num = "";
  //endereço
  String cidade = "";
  String bairro = "";
  String uf = "";
  String cep = "";
  String complemento = "";
  int numero;

  _Cadastro_TState(this.numero) {
    _genSelect = genero[0];
  }
  TextEditingController ufControl = TextEditingController();

  //mascaras:
  final maskCpf = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});
  final maskNum = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});
  final maskCep = MaskTextInputFormatter(
      mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

  final genero = ["Feminino", "Masculino", "Outro"];
  String? _genSelect = "";

  bool concordo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w200,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01)),
                  Text(
                    'Tutor PetCare',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.045,
                        decoration: TextDecoration.none,
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        fontFamily: 'LilitaOne'),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(7, 88, 20, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Dados cadastrais",
                    style: TextStyle(
                        color: Color.fromRGBO(7, 88, 20, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
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
                            setState(() {
                              nome = Text;
                            });
                          },
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: '',
                              labelText: 'Nome completo',
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
                            email1 = Text;
                          },
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: 'exemplo@gmail.com',
                              labelText: 'Email',
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
                            setState(() {
                              email2 = Text;
                            });
                          },
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: 'exemplo@gmail.com',
                              labelText: 'Confirme o email',
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
                            setState(() {
                              senha1 = Text;
                            });
                          },
                          obscureText: true,
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: '**********',
                              labelText: 'Crie uma senha',
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
                            setState(() {
                              senha2 = Text;
                            });
                          },
                          obscureText: true,
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: '**********',
                              labelText: 'Confirme a senha',
                              border: OutlineInputBorder())),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(7, 88, 20, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Informações pessoais",
                    style: TextStyle(
                        color: Color.fromRGBO(7, 88, 20, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Text(
                    "Selecione a data de nascimento:",
                    style: TextStyle(
                        color: Color.fromRGBO(7, 125, 27, 1),
                        //fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: ElevatedButton(
                      onPressed: () => _selectDate(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(7, 125, 27, 1),
                      ),
                      child: Text(
                        DateFormat("dd/MM/yyyy").format(data),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            color: Color.fromARGB(255, 3, 65, 9)),
                      ),
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
                          inputFormatters: [maskCpf],
                          onChanged: (Text) {
                            setState(() {
                              cpf = Text;
                            });
                          },
                          maxLength: 14,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: '',
                              labelText: 'Insira seu CPF',
                              border: const OutlineInputBorder())),
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
                          inputFormatters: [maskNum],
                          onChanged: (Text) {
                            setState(() {
                              num = Text;
                            });
                          },
                          maxLength: 15,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                            hintText: '',
                            labelText: 'Insira seu número de celular',
                            border: const OutlineInputBorder(),
                          )),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: DropdownButtonFormField(
                      value: _genSelect,
                      items: genero.map((e) {
                        return DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _genSelect = val.toString();
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_circle,
                        color: Color.fromRGBO(8, 113, 26, 1),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(7, 88, 20, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(7, 88, 20, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Endereço",
                    style: TextStyle(
                        color: Color.fromRGBO(7, 88, 20, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (Text) {
                                cidade = Text;
                              },
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'Cidade',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (Text) {
                                setState(() {
                                  bairro = Text;
                                });
                              },
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'Bairro',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.015)),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  String a = value.toUpperCase();
                                  uf = a;
                                });
                              },
                              controller: ufControl,
                              maxLength: 2,
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'UF',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (Text) {
                                setState(() {
                                  cep = Text;
                                });
                              },
                              inputFormatters: [maskCep],
                              maxLength: 9,
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'CEP',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.015)),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (text) {
                                setState(() {
                                  complemento = text;
                                  if (complemento.isEmpty) {
                                    complemento = "--";
                                  }
                                });
                              },
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'Complemento',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (Text) {
                                setState(() {
                                  String a = Text;
                                  numero = int.parse(a);
                                });
                              },
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'Número da casa',
                                border: const OutlineInputBorder(),
                              )),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01)),
                  Row(
                    children: [
                      Checkbox(
                        value: concordo,
                        activeColor: const Color.fromRGBO(219, 114, 38, 1),
                        onChanged: (bool? value) {
                          setState(() {
                            concordo = value!;
                          });
                        },
                      ),
                      Text(
                        "Declaro que li e concordo com os ",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      Text(
                        "Termos",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.025)),
                  _btnCadastrar(),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.03)),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(7, 125, 27, 1), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 3, 65, 9), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 3, 65, 9),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    //primary: Colors.red, // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: data,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (pickedDate != null && pickedDate != data) {
      setState(() {
        var format = DateFormat("dd/MM/yyyy");
        datta = format.format(pickedDate);
        data = pickedDate;
      });
    }
  }

  Widget _btnCadastrar() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.065,
      child: ElevatedButton(
        onPressed: () async {
          if (nome != "" &&
              email1 != "" &&
              senha1 != "" &&
              cpf != "" &&
              num != "" &&
              cidade != "" &&
              bairro != "" &&
              uf != "" &&
              cep != "") {
            if (email1 == email2) {
              if (senha1 == senha2) {
                final agr = DateTime.now();
                final agr18 = DateTime.utc(agr.year - 18, agr.month, agr.day);
                if (data.isBefore(agr18)) {
                  if (concordo == true) {
                    Future<ServiceResult> cadastro = tutorRopository.cadTutor(
                        nome,
                        email1,
                        datta,
                        num,
                        cpf,
                        _genSelect.toString(),
                        senha1,
                        cidade,
                        bairro,
                        uf,
                        cep,
                        complemento,
                        numero);

                    var snackBar = const SnackBar(
                        content: Text(
                      "Cadastro realizado com sucesso!",
                      style: TextStyle(fontSize: 15),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    var snackBar = const SnackBar(
                        content: Text(
                      "Você precisa aceitar os termos para prosseguir com o cadastro.",
                      style: TextStyle(fontSize: 15),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  var snackBar = const SnackBar(
                      content: Text(
                    "Você deve ter pelo menos 18 anos para realizar o cadastro.",
                    style: TextStyle(fontSize: 15),
                  ));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              } else {
                var snackBar = const SnackBar(
                    content: Text(
                  "As caixas de senha devem apresentar o mesmo conteúdo.",
                  style: TextStyle(fontSize: 15),
                ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } else {
              var snackBar = const SnackBar(
                  content: Text(
                "As caixas de email devem apresentar o mesmo conteúdo.",
                style: TextStyle(fontSize: 15),
              ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } else {
            var snackBar = const SnackBar(
                content: Text(
              "Todos os campos devem estar preenchidos.",
              style: TextStyle(fontSize: 15),
            ));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color.fromRGBO(7, 88, 20, 1)))),
        child: const Text(
          'Finalizar Cadastro',
          style: TextStyle(fontSize: 19, color: Color.fromRGBO(7, 88, 20, 1)),
        ),
      ),
    );
  }
}
