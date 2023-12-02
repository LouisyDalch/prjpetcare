import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/API/tutoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_feedback_cuid_t.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_pet_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_pet_t.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';

class VisualCuidador_T extends StatefulWidget {
  final int idCuid;
  final bool btnSolic;
  const VisualCuidador_T({super.key, required this.idCuid,
  required this.btnSolic});

  @override
  State<VisualCuidador_T> createState() => _VisualCuidador_TState(
      idCuid: idCuid, tutorRopository: TutorRopository(),btnSolic: btnSolic);
}

class _VisualCuidador_TState extends State<VisualCuidador_T> {
  bool btnSolic;
  List<InfoCuidP> lstCuid = [];
  List<EndTutor> lstEnd = [];
  List<TipoServT> lstTipoS = [];
  List<DiasTutor> lstDias = [];
  List<TipoPet> lstTipoP = [];
  List<FeedbackTutor> lstFeedback = [];

  TutorRopository tutorRopository;

  int idCuid;
  bool abra = false;

  Uint8List? _imageData;

  String nomeCuid = "";
  DateTime dataNasceu = DateTime.now();
  double valor = 0.0;
  String cell = "";
  String email = "";
  int idTipoServ = 0;
  int idAgenda = 0;
  int idTipoPet = 0;
  double valorBD = 0.0;

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  int hospI = 0;
  int crecheI = 0;
  int petSitterI = 0;
  int passeioI = 0;
  int adestraI = 0;

  int domI = 0;
  int segI = 0;
  int terI = 0;
  int quaI = 0;
  int quiI = 0;
  int sexI = 0;
  int sabI = 0;

  int cao = 0;
  int gato = 0;
  int roedor = 0;
  int peixe = 0;
  int aves = 0;
  int outros = 0;

  String cancelam = "";

  _VisualCuidador_TState({
    required this.idCuid, 
    required this.tutorRopository,
    required this.btnSolic}): super();

  Future<ListResult> getInfoCuid() async {
    return await tutorRopository.puxarCuidHosp();
  }

  Future<ListResult> getEndCuid() async {
    return await tutorRopository.puxarEndCuidTutor(idCuid.toString());
  }

  Future<ListResult> getTipoServ() async {
    return await tutorRopository.puxarTipoServTutor(idTipoServ.toString());
  }

  Future<ListResult> getDias() async {
    return await tutorRopository.puxarDias(idAgenda.toString());
  }

  Future<ListResult> getTipoPet() async {
    return await tutorRopository.puxarTipoPet(idTipoPet.toString());
  }

  Future<ListResult> getFeedbackT() async {
    return await tutorRopository.puxarFeedbackTutor(idCuid.toString());
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

  Future<void> _loadImage() async {
    Uint8List data = await tutorRopository.getImageDataTutor(idCuid);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

  void loadFeedback() async {
    ListResult feedbackTutor = await getFeedbackT();
    setState(() {
      var length = feedbackTutor.resultados.length;
      print("feedback $length");
      lstFeedback = [];
      for (var element in feedbackTutor.resultados) {
        lstFeedback.add(
          FeedbackTutor(
              coment: element["comentario"],
              data: DateTime.tryParse(element["data"]),
              aval: element["aval"],
              idTutor: element["idDono"],
              idCuid: element["idCuid"]),
        );
      }
    });
  }

  void loadTipoServ() async {
    ListResult tipoServico = await getTipoServ();
    setState(() {
      lstTipoS = [];
      for (var element in tipoServico.resultados) {
        lstTipoS.add(
          TipoServT(
              idTipoServ: element["idTipoServ"],
              hosp: element["hosp"],
              creche: element["creche"],
              petSitter: element["petSitter"],
              passeio: element["passeio"],
              adestra: element["adestra"]),
        );
      }
      TipoServT a = lstTipoS[0];
      hospI = a.hosp;
      crecheI = a.creche;
      petSitterI = a.petSitter;
      passeioI = a.passeio;
      adestraI = a.adestra;
    });
  }

  void loadDias() async {
    ListResult dias = await getDias();
    setState(() {
      lstDias = [];
      for (var element in dias.resultados) {
        lstDias.add(
          DiasTutor(
              idAgenda: element["idAgenda"],
              dom: element["dom"],
              seg: element["seg"],
              ter: element["ter"],
              qua: element["qua"],
              qui: element["qui"],
              sex: element["sex"],
              sab: element["sab"]),
        );
      }
      DiasTutor a = lstDias[0];
      domI = a.dom;
      segI = a.ter;
      terI = a.ter;
      quaI = a.qua;
      quiI = a.qui;
      sexI = a.sex;
      sabI = a.sab;
    });
  }

  void loadTipoPet() async {
    ListResult tipos = await getTipoPet();
    setState(() {
      lstTipoP = [];
      for (var element in tipos.resultados) {
        lstTipoP.add(
          TipoPet(
              idTipoPet: element["idTipoPet"],
              cao: element["cao"],
              gato: element["gato"],
              roedor: element["roedor"],
              peixe: element["peixe"],
              aves: element["aves"],
              outros: element["outros"]),
        );
      }
      TipoPet a = lstTipoP[0];
      cao = a.cao;
      gato = a.gato;
      roedor = a.roedor;
      peixe = a.peixe;
      aves = a.aves;
      outros = a.outros;
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

  @override
  void initState() {
    super.initState();
    loadInfos();
    loadFeedback();
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
    loadEndereco();
    loadTipoServ();
    loadDias();
    loadTipoPet();
    _loadImage();
  }

  //fundovistut
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            WidBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "defora/imagens/fundoperfilcuidT.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.brown,
                            image: _imageData != null
                        ? DecorationImage(
                            image: MemoryImage(_imageData!),
                            fit: BoxFit.cover,
                        )
                          : null,),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.05),
                      
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text("Preço: R\$$valor/hora"),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.07,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: ElevatedButton(
                                onPressed: btnSolic != false ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            SolicServico(
                                              idCuid: idCuid,
                                              nome: nomeCuid,
                                              tipoServ: "Hospedagem",
                                              valor: valorBD,
                                              )
                                            )
                                          )
                                          ):null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 9, 153, 26),
                                ),
                                child: Text(
                                  'Solicitar',
                                  style: TextStyle(
                                      fontFamily: 'LilitaOne',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: Color.fromARGB(255, 10, 10, 10)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Text(
                                nomeCuid,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.06,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${_calcularIdade(dataNasceu)} anos",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Localização",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "$rua - $bairro, $cidade - $uf",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dias disponíveis",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Domingo",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(domI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Segunda",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(segI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Terça",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(terI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Quarta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(quaI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Quinta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(quiI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Sexta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(sexI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Sábado",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(sabI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Serviços prestados",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Hospedagem",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(hospI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Adestramento",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(adestraI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Creche",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(crecheI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Pet Sitter",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(petSitterI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Passeios",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(passeioI),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Cuido de...",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Cães",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(cao),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Gatos",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(gato),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Roedores",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(roedor),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Aves",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(aves),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Peixes",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(peixe),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Outros",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(outros),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Formas de contato",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          child: Text(
                                            cell,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          child: Text(
                                            email,
                                            style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.05,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Avaliações",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: lstFeedback.length,
                                itemBuilder: (context, index) {
                                  FeedbackTutor a = lstFeedback[index];
                                  return ItemFeedback_T(
                                    feedback: a,
                                  );
                                }),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.15),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.88,
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
                child: MenuHorTutor(),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.063,
                    top: MediaQuery.of(context).size.width * 0.03,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1),
              ),
            ),
          ],
        ),
      
    );
  }

  Color disponivel(int t) {
    if (t == 0) {
      return Color.fromARGB(255, 168, 168, 168);
    } else {
      return Colors.green;
    }
  }

}
