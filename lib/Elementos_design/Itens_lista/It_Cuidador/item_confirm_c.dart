import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/telas/cuidador/visual_servconf_c.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';

import '../../../API/cuidadoresmet.dart';
import '../../../Repositorios/cuidador_repos.dart';

class ItemConfirmC extends StatefulWidget {
  final ServicoSolic servico;
//aaaaa
  const ItemConfirmC({super.key,
  required this.servico,});

  @override
  State<ItemConfirmC> createState() => _ItemConfirmCState(servico: servico, cuidadorRepository: CuidadorRepository());
}

class _ItemConfirmCState extends State<ItemConfirmC> {
  ServicoSolic servico;
  Uint8List? _imageData;
  CuidadorRepository cuidadorRepository;
  List lst = [];
  List<TipoServ> lstTipoServ = [];

  _ItemConfirmCState({
      required this.servico,
      required this.cuidadorRepository,
    }) : super();
    
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
    print(this.servico.idDono);
    _loadImage();
    loadTipoServ();
    
  }

    Future<void> _loadImage() async {
    Uint8List data = await cuidadorRepository.getImageDataTutor(this.servico.idDono);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: GestureDetector(
        onTap:  () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (
              (context) => VisualServConf(idPet: servico.idPet, idDono: servico.idDono, idServ: servico.idServ,)))),
       
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
                        : null,
                  ),
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
                      Text(_tipoServicoNome(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                       Text(servico.donoNome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Text(servico.nomePet,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.004)),
                       Text('Data de término: ${servico.dataIni != null ?
                      DateFormat('dd/MM/yyyy').format(servico.dataIni!) 
                      : 'Data inválida'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      const Text('Data/hra fin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
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
