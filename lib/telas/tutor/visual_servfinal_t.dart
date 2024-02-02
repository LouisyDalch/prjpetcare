import 'dart:typed_data';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/LinksConection/url_links.dart';
import 'package:prjpetcare/telas/tutor/pagamento.dart';
import 'package:prjpetcare/telas/tutor/perfil_pet_t.dart';
import 'package:prjpetcare/telas/tutor/visual_cuidador_t.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../API/tutoresmet.dart';
import '../../Repositorios/tutor_repos.dart';


class VisualServFinal_T extends StatefulWidget {
  final ServicoSolic servico;
  final String tipoServico;
  const VisualServFinal_T(
      {super.key, required this.servico, required this.tipoServico});

  @override
  State<VisualServFinal_T> createState() => _VisualServFinal_TState(
      servico: servico,
      tipoServico: tipoServico,
      tutorRopository: TutorRopository());
}



class _VisualServFinal_TState extends State<VisualServFinal_T> {
  ServicoSolic servico;
  String tipoServico;
  TutorRopository tutorRopository;
  int _rating = 0;

  
  

  List<InfoCuidP> lstCuid = [];
  List<PetTutor> lstPets = [];
  List<EndTutor> lstEnd = [];

  String nomeCuid = "";
  DateTime dataNasceu = DateTime.now();
  double valor = 0.0;
  String cell = "";
  String email = "";
  int idTipoServ = 0;
  int idAgenda = 0;
  int idTipoPet = 0;
  double valorBD = 0.0;

  String nome = "";
  DateTime data = DateTime.now();
  String gen = "";
  double peso = 0;
  String porte = "";
  String raca = "";
  String vac = "";
  int tipoPet = 1;
  String obs = "";

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  Uint8List? _imageData;
  Uint8List? _imageDataPet;

  void initState() {
    super.initState();
    loadInfos();
    loadPet();
    _loadImage();
    _loadImagePet();
    loadEndereco();
  }

  Future<ListResult> getInfoCuid() async {
    return await tutorRopository.puxarInfoCuidUM(servico.idCuidador);
  }

  Future<ListResult> getPet() async {
    return await tutorRopository.puxarPet(servico.idPet.toString());
  }

  Future<ListResult> getEndCuid() async {
    return await tutorRopository
        .puxarEndCuidTutor(servico.idCuidador.toString());
  }

  void loadInfos() async {
    ListResult infos = await getInfoCuid();
    setState(() {
      lstCuid = [];
      for (var element in infos.resultados) {
        lstCuid.add(InfoCuidP(
            idCuidador: element['id_cuidador'],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element["datanasce"]),
            telefone: element["telefone"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"],
            especializacao: element["especializacao"],
            tempoExper: element["tempoexper"],
            valor: element["valor"],
            idEnd: element["id_end"],
            idTipoServ: element["id_tipoServ"],
            idTipoPet: element["id_TipoPet"],
            idAgenda: element["id_Agenda"]));
      }
      InfoCuidP a = lstCuid[0];
      nomeCuid = a.nome;
      dataNasceu = a.dataNasce!;
      valor = a.valor;
      cell = a.telefone;
      email = a.email;
      idTipoServ = a.idTipoServ;
      idAgenda = a.idAgenda;
      idTipoPet = a.idTipoPet;
      valorBD = a.valor;
    });
  }

  void loadPet() async {
    ListResult infos = await getPet();
    setState(() {
      lstPets = [];
      for (var element in infos.resultados) {
        lstPets.add(PetTutor(
            idPet: element['idPet'],
            nome: element["nome"],
            dataNasce: DateTime.tryParse(element['data']),
            raca: element["raca"],
            sexo: element["sexo"],
            peso: element["peso"],
            porte: element["porte"],
            vacinacao: element['vacinacao'],
            descricao: element['descricao'],
            idDono: element["idDono"],
            idTipoPet: element["idTipoPet"]));
      }
      PetTutor pet = lstPets[0];
      nome = pet.nome;
      data = pet.dataNasce!;
      gen = pet.sexo;
      peso = pet.peso;
      porte = pet.porte;
      raca = pet.raca;
      vac = pet.vacinacao;
      tipoPet = pet.idTipoPet;
      obs = pet.descricao;
    });
  }

  void loadEndereco() async {
    ListResult end = await getEndCuid();
    setState(() {
      for (var element in end.resultados) {
        lstEnd = [];
        lstEnd.add(EndTutor(
            idEndereco: element["idEndereco"],
            rua: element["rua"],
            bairro: element["bairro"],
            num: element["num"],
            comple: element["comple"],
            cep: element["cep"],
            cidade: element["cidade"],
            uf: element["uf"]));
      }
      EndTutor a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
  }

  Future<void> _loadImage() async {
    Uint8List data =
        await tutorRopository.getImageDataTutor(servico.idCuidador);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

  Future<void> _loadImagePet() async {
    Uint8List data = await tutorRopository.getImagePet(servico.idPet);
    print(data.length);
    if (mounted) {
      setState(() {
        _imageDataPet = data;
      });
    }
  }

  int _calcularIdade(DateTime dataNasceu) {
    DateTime verifica =
        DateTime(DateTime.now().year, dataNasceu.month, dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    if (DateTime.now().isBefore(verifica)) {
      idade = hoje.year - dataNasceu.year - 1;
    } else {
      idade = hoje.year - dataNasceu.year;
    }
    return idade;
  }

  String _calcularIdadePet(DateTime dataNasceu) {
    DateTime verifica =
        DateTime(DateTime.now().year, dataNasceu.month, dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    int mes;
    if (DateTime.now().isBefore(verifica)) {
      idade = hoje.year - dataNasceu.year - 1;
    } else {
      idade = hoje.year - dataNasceu.year;
    }
    String a;

    if (idade > 0) {
      a = "$idade anos";
    } else {
      //calcular meses
      int mes = hoje.month - dataNasceu.month;
      if (mes > 1) {
        a = "$mes meses";
      } else {
        if (hoje.day > dataNasceu.day) {
          a = "$mes mês";
        } else {
          final mds = hoje.difference(dataNasceu).inDays;
          a = "$mds dias";
        }
      }
    }

    return a;
  }

  _VisualServFinal_TState(
      {required this.servico,
      required this.tipoServico,
      required this.tutorRopository})
      : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Serviço Finalizado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(143, 153, 153, 153),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Sobre o cuidador",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(8, 105, 16, 1),
                                  shape: BoxShape.circle,
                                  image: _imageData != null
                                      ? DecorationImage(
                                          image: MemoryImage(_imageData!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.47,
                                    child: Text(
                                      nomeCuid,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  WebView()))),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.47,
                                        child: Text(
                                            "${_calcularIdade(dataNasceu)} anos")),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                          "$rua - $bairro, $cidade - $uf")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  VisualCuidador_T(
                                                      idCuid: servico
                                                          .idCuidador, btnSolic: false,
                                                          tipoServ: "Sem")))),
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(8, 105, 16, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Text(
                                    "Meu pet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(8, 105, 16, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  image: _imageDataPet != null
                                      ? DecorationImage(
                                          image: MemoryImage(_imageDataPet!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                        nome,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(_calcularIdadePet(data))),
                                  GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => PerfilPet_T(
                                              idPet: servico.idPet)))),
                                    child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.47,
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(8, 105, 16, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Modalidade: $tipoServico",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Início: ${servico.dataIni != null ? DateFormat('dd/MM/yyyy').format(servico.dataIni!) : 'Data inválida'} às ${servico.dataIni != null ? DateFormat('hh:mm').format(servico.dataIni!) : 'Data inválida'}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Término: ${servico.dataFin != null ? DateFormat('dd/MM/yyyy').format(servico.dataFin!) : 'Data inválida'} às ${servico.dataFin != null ? DateFormat('hh:mm').format(servico.dataFin!) : 'Data inválida'}",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Deixe sua avaliação para contribuir com o cuidador!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05),
                              )),
                          
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                           SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) => PagamentoTutor(serv: servico))));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 1, 127, 14),
                              ),
                              child: Text(
                                'Pagar Cuidador',
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              onPressed: () {
                                showAlertDialog(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 1, 127, 14),
                              ),
                              child: Text(
                                'Adicionar Feedback',
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                    Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          MenuHorTutor()
                    
                  ],
                ),
              ),
            ],
          ),
         
        ],
      ),
    );
  }

  String coment = "";
  double rating = 0;
  int aval = 0;
  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Envie sua avaliação!"),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: rating,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: MediaQuery.of(context).size.width * 0.1,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return Icon(
                            Icons.sentiment_very_dissatisfied,
                            color: Colors.red,
                          );
                        case 1:
                          return Icon(Icons.sentiment_dissatisfied,
                              color: Colors.redAccent);
                        case 2:
                          return Icon(Icons.sentiment_neutral,
                              color: Colors.orange);
                        case 3:
                          return Icon(Icons.sentiment_satisfied,
                              color: Colors.lightGreen);
                        case 4:
                          return Icon(Icons.sentiment_very_satisfied,
                              color: Colors.green);
                        default:
                          return Text("123");
                      }
                    },
                    onRatingUpdate: (ratingg) {
                      // Este callback é chamado quando o usuário atualiza a avaliação.
                      setState(() {
                        rating = ratingg;
                      });
                      aval = rating.toInt();
                      // Aqui você pode realizar ações com a nova avaliação, por exemplo, enviar para um servidor.
                    },
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
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
                        setState(() {
                          coment = Text;
                        });
                      },
                      autocorrect: false,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: "",
                          labelText: "Digite seu Feedback!",
                          border: const OutlineInputBorder()),
                    ),
                  ],
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      var formatter = DateFormat("dd/MM/yyyy");
                      String data = formatter.format(DateTime.now());
                      Future<ServiceResult> cadastro =
                          tutorRopository.cadastrarFeedback(
                              coment, data, aval, servico.idCuidador);
                      var snackBar = const SnackBar(
                          content: Text(
                        "Feedback enviado com sucesso!",
                        style: TextStyle(fontSize: 15),
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('Enviar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              ),
            ],
          
        );
      },
    );
  }
  
}

