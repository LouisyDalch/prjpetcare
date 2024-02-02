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

class Cadastro_C extends StatefulWidget {
  const Cadastro_C({super.key});

  @override
  State<Cadastro_C> createState() => _Cadastro_CState(0);
}

class _Cadastro_CState extends State<Cadastro_C> {
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
  String rua ="";
  int numero;

  _Cadastro_CState(this.numero) {
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
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w200,
                        fontSize: MediaQuery.of(context).size.height * 0.04),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.01)),
                  Text(
                    'Cuidador PetCare',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.045,
                        decoration: TextDecoration.none,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        fontFamily: 'LilitaOne'),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Dados cadastrais",
                    style: TextStyle(
                        color: Color.fromRGBO(219, 114, 38, 1),
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
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Informações pessoais",
                    style: TextStyle(
                        color: Color.fromRGBO(219, 114, 38, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Text(
                    "Selecione a data de nascimento:",
                    style: TextStyle(
                        color: Color.fromRGBO(219, 114, 38, 1),
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
                        backgroundColor: Color.fromRGBO(219, 114, 38, 1),
                      ),
                      child: Text(
                        DateFormat("dd/MM/yyyy").format(data),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            color: Color.fromRGBO(0, 0, 0, 1),),
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
                        color: Color.fromRGBO(219, 114, 38, 1),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.02)),
                  Row(
                    children: [
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                      Container(
                        height: 2,
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: const Color.fromRGBO(219, 114, 38, 1),
                      ),
                      Container(
                        color: const Color.fromRGBO(219, 114, 38, 1),
                        height: 8,
                        width: 8,
                      ),
                    ],
                  ),
                  Text(
                    "Endereço",
                    style: TextStyle(
                        color: Color.fromRGBO(219, 114, 38, 1),
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
                   Container(
                        width: MediaQuery.of(context).size.width * 0.82,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Form(
                          child: TextFormField(
                              onChanged: (Text) {
                                setState(() {
                                  rua = Text;
                                });
                              },
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: '',
                                labelText: 'Rua',
                                border: const OutlineInputBorder(),
                              )),
                        ),
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
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) => TermoConsentimento())
                                                  ));
                        },
                        child: Text(
                          "Termos",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
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
                primary: Color.fromRGBO(219, 114, 38, 1), // <-- SEE HERE
                onPrimary: Color.fromRGBO(99, 50, 16, 1), // <-- SEE HERE
                onSurface: Color.fromRGBO(219, 114, 38, 1),
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
        print(data);
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
              cep != ""&&
              rua !="") {
            if (email1 == email2) {
              if (senha1 == senha2) {
                if(concordo == true){
                  final agr = DateTime.now();
                  print(data);
                final agr18 = DateTime.utc(agr.year - 18, agr.month, agr.day);
                if (data.compareTo(agr18) < 0) {
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
                        numero,
                        rua);
                        Navigator.pop(context);

                    var snackBar = const SnackBar(
                        content: Text(
                      "Cadastro realizado com sucesso!",
                      style: TextStyle(fontSize: 15),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }else{
                   var snackBar = const SnackBar(
                        content: Text(
                      "Você deve estar ciente dos termos para completar o cadastro",
                      style: TextStyle(fontSize: 15),
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                
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
                    "Declare que leu os termos",
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
                side: const BorderSide(color: Color.fromRGBO(219, 114, 38, 1),))),
        child: const Text(
          'Finalizar Cadastro',
          style: TextStyle(fontSize: 19, color: Color.fromRGBO(219, 114, 38, 1),),
        ),
      ),
    );
  }
}

class TermoConsentimento extends StatefulWidget {
  const TermoConsentimento({super.key});

  @override
  State<TermoConsentimento> createState() => _TermoConsentimentoState();
}

class _TermoConsentimentoState extends State<TermoConsentimento> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Container(height: MediaQuery.of(context).size.height * 0.1,),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("Termo de Uso e Política de Privacidade do Aplicativo PetCare",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.07
                ),),
              ),
              Container(height: MediaQuery.of(context).size.height * 0.03,),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(children: [
                  Text("PetCare é uma plataforma que conecta tutores e cuidadores de pets em todo o Brasil. Nosso compromisso é tornar a vida dos pais de pet mais fácil, proporcionando acesso simplificado a serviços como hospedagem e outros relacionados a pets.",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.05
                  ),),
                  Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("1. Privacidade dos Usuários",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    
                  ),
                  Text("A sua privacidade é de extrema importância para nós. Comprometemo-nos a respeitar a sua privacidade em relação a qualquer informação que possamos coletar enquanto você utiliza nosso aplicativo. Os dados aqui armazenados serão utilizados unicamente para fins de cadastramento e efetivação do uso de nossos serviços dentro do nosso aplicativo.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("2. Coleta de Informações",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  ),
                  Text("Solicitamos informações pessoais apenas quando realmente necessárias para fornecer informações sobre um serviço ou produto. Fazemos isso de maneira justa e legal, sempre com o seu conhecimento e consentimento. As informações são armazenadas com o fim de tornar o acesso mais intuitivo ao nosso aplicativo.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                   Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("3. Compartilhamento de Informações",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  ),
                  Text("Nos comprometemos a não compartilhar publicamente informações de identificação pessoal, a menos que seja exigido por lei ou mediante o seu consentimento expresso",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("4. Links para Sites Externos",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  ),
                  Text("Nosso aplicativo pode conter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e as práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                   Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("5. Lei Geral de Proteção de Dados Pessoais (LGPD)",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  ),
                  Text("Todas as ações relacionadas ao Tratamento de Dados Pessoais e ao Titular de Dados Pessoais seguirão os princípios norteadores estabelecidos na Lei Geral de Proteção de Dados Pessoais – LGPD (Lei n° 13.709/2018). A PetCare assume a responsabilidade pelo tratamento de todos os dados pessoais coletados, em conformidade com as disposições da LGPD.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  Container(height: MediaQuery.of(context).size.height * 0.02,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("5. Contato",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                  ),
                   Text("Se você tiver dúvidas ou preocupações relacionadas à sua privacidade ou a este termo de uso e política de privacidade, entre em contato conosco através do seguinte endereço de e-mail: equipepetcare@gmail.com.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    Container(height: MediaQuery.of(context).size.height * 0.03,),
                    Text("Ao utilizar o aplicativo PetCare, você concorda com os termos e as práticas descritas neste documento. Se você não concorda com estes termos, por favor, não continue utilizando nossos serviços",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    Container(height: MediaQuery.of(context).size.height * 0.01,),
                    Text("Este termo de uso e política de privacidade está sujeito a alterações. Quaisquer atualizações serão publicadas nesta página para que você esteja sempre informado sobre como suas informações estão sendo coletadas e utilizadas.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    Text("Agradecemos por escolher o PetCare para suas necessidades relacionadas a pets. Estamos aqui para tornar a experiência de cuidar do seu pet mais fácil e agradável.",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05
                    ),),
                    Container(height: MediaQuery.of(context).size.height * 0.05,),
                    SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(219, 114, 38, 1),
                      ),
                      child: Text(
                        'Ok',
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            color: const Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.05,),
                ]),
              )
            ],),
          ),
        ],
      ),
    );
  }
}
