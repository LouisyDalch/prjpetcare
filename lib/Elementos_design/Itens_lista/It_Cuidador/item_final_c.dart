import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:prjpetcare/telas/cuidador/visual_servfinal_c.dart';

import '../../../API/cuidadoresmet.dart';

class ItemFinalC extends StatefulWidget {
  final ServicoSolic servico;
  const ItemFinalC({super.key,
  required this.servico});

  @override
  State<ItemFinalC> createState() => _ItemFinalCState(servico: servico, cuidadorRepository: CuidadorRepository());
}

class _ItemFinalCState extends State<ItemFinalC> {
  ServicoSolic servico;
  CuidadorRepository cuidadorRepository;
  _ItemFinalCState({
    required this.servico,
    required this.cuidadorRepository
  }):super();
   Uint8List? _imageData;

  Future<void> _loadImage() async {
    Uint8List data = await cuidadorRepository.getImageDataTutor(this.servico.idDono);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }
  List<TipoServ> lstTipoServ = [];

  int hospI = 0;
    int crecheI = 0;
    int petSitterI = 0;
    int passeioI = 0;
    int adestraI = 0;

    Future<ListResult> getTipoServ() async {
    return await cuidadorRepository.puxarTipoServ(servico.idTipoServ.toString());
  }

   @override
  void initState() {
    super.initState();
    _loadImage();
    loadTipoServ();
  }

   void loadTipoServ() async {
    ListResult tipoServico = await getTipoServ();
    setState(() {
      lstTipoServ = [];
      for (var element in tipoServico.resultados) {
        lstTipoServ.add(TipoServ(
            idTipoServ: element["idTipoServ"],
            hosp: element["hosp"],
            creche: element["creche"],
            petSitter: element["petSitter"],
            passeio: element["passeio"],
            adestra: element["adestra"]),);
      }
      TipoServ a = lstTipoServ[0];
      hospI = a.hosp;
      crecheI = a.creche;
      petSitterI = a.petSitter;
      passeioI = a.passeio;
      adestraI = a.adestra;
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
      onTap: () {
        Navigator.push(
            context, 
            MaterialPageRoute(builder: (
              (context) => VisualServFinal(servico: servico,nomeServico: _tipoServicoNome(),))));
      },
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
                  decoration:  BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                    image: _imageData != null
                            ? DecorationImage(
                                image: MemoryImage(_imageData!),
                                fit: BoxFit.cover,
                            )
                              : null                ),
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
                        child: Text(servico.donoNome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('Término: ${servico.dataFin != null ?
                          DateFormat('dd/MM/yyyy').format(servico.dataFin!) 
                          : 'Data inválida'}',
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
