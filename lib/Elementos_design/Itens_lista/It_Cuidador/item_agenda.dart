import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../../API/cuidadoresmet.dart';
import '../../../Repositorios/cuidador_repos.dart';
//program
class ItemList extends StatefulWidget {
  final Servico servico;

  const ItemList({
    super.key,
    required this.servico,});

  @override
  State<ItemList> createState() => _ItemListState(servico: servico, cuidadorRepository: CuidadorRepository());
}

class _ItemListState extends State<ItemList> {
  Servico servico;
  List<TipoServ> lst = [];
  _ItemListState({
      required this.servico,
      required this.cuidadorRepository
    }) : super();

    CuidadorRepository cuidadorRepository;
    int hospI = 0;
    int crecheI = 0;
    int petSitterI = 0;
    int passeioI = 0;
    int adestraI = 0;

    Future<ListResult> getTipoServ() async {
    return await cuidadorRepository.puxarTipoServ(servico.idTipoServ.toString());
  }

  void initState() {
    super.initState();
    loadTipoServ();
  }

  void loadTipoServ() async {
    ListResult tipoServico = await getTipoServ();
    setState(() {
      lst = [];
      for (var element in tipoServico.resultados) {
        lst.add(TipoServ(
            idTipoServ: element["idTipoServ"],
            hosp: element["hosp"],
            creche: element["creche"],
            petSitter: element["petSitter"],
            passeio: element["passeio"],
            adestra: element["adestra"]),);
      }
      TipoServ a = lst[0];
      hospI = a.hosp;
      crecheI = a.creche;
      petSitterI = a.petSitter;
      passeioI = a.passeio;
      adestraI = a.adestra;
      print("id:${a.idTipoServ}");
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
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 223, 223),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(children: [
              Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.01)),
              Text(
                _tipoServicoNome(),
                style: TextStyle(
                    fontFamily: 'LilitaOne',
                    fontSize: MediaQuery.of(context).size.width * 0.06),
              )
            ]),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.007)),
                Text(servico.donoNome, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.017)),
                Text(servico.dataIni != null ?
                    DateFormat('dd/MM/yyyy').format(servico.dataIni!) 
                    : 'Data inválida', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.007)),
                Text(servico.nomePet, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
