import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/pago.dart';

class PagamentoTutor extends StatefulWidget {
  final ServicoSolic serv;
  const PagamentoTutor({super.key,
  required this.serv});

  @override
  State<PagamentoTutor> createState() => _PagamentoTutorState(serv: serv);
}

class _PagamentoTutorState extends State<PagamentoTutor> {
  ServicoSolic serv;
  String nome = "";
  String num = "";
  String nomecart = "";
  String valid = "";
  String cvv = "";
  bool cartao = false;
  void initState() {
    super.initState();
    cartao = false;
  }

  _PagamentoTutorState({
    required this.serv
  }):super();

  TextEditingController ufControl = TextEditingController();

  //mascaras:
  final maskCep = MaskTextInputFormatter(
      mask: "XXXX.XXXX.XXXX.XXXX", filter: {"X": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Servico",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.08),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "Creche",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "Prestador: Pedro Cauã Silva Alves",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Dados Pessoais",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.08),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        nome = Text;
                      },
                      
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Nome',
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                       // nome = Text;
                      },
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                       // nome = Text;
                      },
                      autocorrect: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                        
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: muda(),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextButton(
                      onPressed: cartao == true
                          ? () {
                              setState(() {
                                cartao = !cartao;
                              });
                            }
                          : null,
                      child: Text(
                        "Crédito",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  Container(
                    color: muda2(),
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextButton(
                      onPressed: cartao == false
                          ? () {
                              setState(() {
                                cartao = !cartao;
                              });
                              print("da");
                            }
                          : null,
                      child: Text(
                        "Débito",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text(
                  "Informações de Pagamento",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.08),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.73,
                child: Text(
                  "Preço: R\$${serv.valor}",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        num = Text;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [maskCep],
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Número do Cartão',
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  child: TextFormField(
                      onChanged: (Text) {
                        nomecart = Text;
                      },
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Nome do Cartão',
                        border: OutlineInputBorder(),
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Form(
                      child: TextFormField(
                          onChanged: (Text) {
                            valid = Text;
                          },
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: 'Validade',
                            border: OutlineInputBorder(),
                          )),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Form(
                      child: TextFormField(
                          onChanged: (Text) {
                            cvv = Text;
                          },
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: 'CVV',
                            border: OutlineInputBorder(),
                          )),
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                   var snackBar = const SnackBar(
                          content: Text(
                        "Pagamento feito com sucesso!",
                        style: TextStyle(fontSize: 15),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => FoiPago())));
                      
                      Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 1, 127, 14),
                              ),
                              child: Text(
                                'Pagar',
                                style: TextStyle(
                                    fontFamily: 'LilitaOne',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Color.fromARGB(255, 231, 231, 231)),
                              ),
                            ),
                          ),
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color muda() {
    if (cartao == true) {
      return Colors.green;
    }
    return Colors.white;
  }

  Color muda2() {
    if (cartao != true) {
      return Colors.green;
    }
    return Colors.white;
  }
}
