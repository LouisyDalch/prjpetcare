import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';
import 'package:prjpetcare/telas/tutor/visual_servsolic_t.dart';

import '../../../API/tutoresmet.dart';

class ItemSolicT extends StatefulWidget {
  final ServicoSolic servico;
  const ItemSolicT({super.key,
  required this.servico});

  @override
  State<ItemSolicT> createState() => _ItemSolicTState(servico: servico,tutorRopository: TutorRopository());
}

class _ItemSolicTState extends State<ItemSolicT> {
  ServicoSolic servico;
  TutorRopository tutorRopository;
  List<TipoServT> lstTipoS = [];
  List<InfoCuidP> lstCuid = [];

  int hospI = 0;
  int crecheI = 0;
  int petSitterI = 0;
  int passeioI = 0;
  int adestraI = 0;

  String nomeCuid = "";
  DateTime dataNasceu = DateTime.now();
  double valor = 0.0;
  String cell = "";
  String email = "";
  int idTipoServ = 0;
  int idAgenda = 0;
  int idTipoPet = 0;
  double valorBD = 0.0;

  Uint8List? _imageData;

  @override
  void initState() {
    super.initState();
    loadInfos();
    loadTipoServ();
    _loadImage();
    
  }

  


  Future<ListResult> getInfoCuid() async {
    return await tutorRopository.puxarInfoCuidUM(servico.idCuidador);
  }

   Future<ListResult> getTipoServ() async {
    return await tutorRopository.puxarTipoServTutor(servico.idTipoServ.toString());
  }

  _ItemSolicTState({
    required this.servico,
    required this.tutorRopository
  }):super();


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
      print(a.idTipoServ);
    });
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

  Future<void> _loadImage() async {
    Uint8List data = await tutorRopository.getImageDataTutor(servico.idCuidador);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }


  String _tipoServicoNome(){
    String servico = "";
    if(hospI ==1){
      servico ="Hospedagem";
    }
    if(crecheI == 1){
      servico ="Creche";
    }
    if(petSitterI == 1){
      servico = "PetSitter";
    }
    if(passeioI == 1){
      servico = "Passeio";
    }
    if(adestraI == 1){
      servico = "Adestramento";
    }
    return servico;
  }

  

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Navigator.push(
            context, 
            MaterialPageRoute(builder: (
              (context) => VisualServSolic_T(servico: servico,tipoServ: _tipoServicoNome(),)))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.16,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.16,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: _imageData != null
                          ? DecorationImage(
                              image: MemoryImage(_imageData!),
                              fit: BoxFit.cover,
                          )
                            : null),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(_tipoServicoNome(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(nomeCuid,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text("Início: ${servico.dataIni != null ?
                        DateFormat('dd/MM/yyyy').format(servico.dataIni!) 
                        : 'Data inválida'}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                    ],
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
