import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/visual_cuidador_t.dart';

import '../../../API/tutoresmet.dart';


class ItemMostrarCrecheT extends StatefulWidget {
  final InfoCuidP cuid;
  const ItemMostrarCrecheT({super.key,
  required this.cuid});

  @override
  State<ItemMostrarCrecheT> createState() => _ItemMostrarCrecheTState(cuid: cuid, tutorRopository: TutorRopository());
}

class _ItemMostrarCrecheTState extends State<ItemMostrarCrecheT> {
  InfoCuidP cuid;

  _ItemMostrarCrecheTState({
    required this.cuid,
    required this.tutorRopository
  }):super();

  TutorRopository tutorRopository;
  List<EndTutor> lstEnd = [];
  List<SomaAval> lstSomaAval = [];

  Uint8List? _imageData;

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";
  int somaAvalI = 0;

  Future<ListResult> getEndCuid() async {
    return await tutorRopository.puxarEndCuidTutor(cuid.idCuidador.toString());
  }

  Future<ListResult> getSomaAval() async {
    return await tutorRopository.puxarSomaAval(cuid.idCuidador.toString());
  }

  void initState() {
    super.initState();
    loadEndereco();
    loadSomaAval();
    _loadImage();
  }

  Future<void> _loadImage() async {
    Uint8List data = await tutorRopository.getImageDataTutor(this.cuid.idCuidador);
    print("imagem carregou");
    setState(() {
      _imageData = data;
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
            uf: element["uf"]
            ));
      }
      EndTutor a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
    
   
  }

  void loadSomaAval() async {
    ListResult end = await getSomaAval();
    setState(() {
      for (var element in end.resultados) {
        lstSomaAval = [];
         lstSomaAval.add(SomaAval(
            somaAval: element["somaAval"]
            ));
      }
      SomaAval b = lstSomaAval[0];
      somaAvalI = b.somaAval;
    });
    
   
  }

  int _calcularIdade (DateTime dataNasceu){
    DateTime verifica = DateTime(DateTime.now().year, dataNasceu.month,dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    if(DateTime.now().isBefore(verifica)){
      idade = hoje.year - dataNasceu.year - 1;
    }else{
      idade = hoje.year - dataNasceu.year;
    }
    return idade;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (
              (context) => VisualCuidador_T(idCuid: cuid.idCuidador,btnSolic: true,tipoServ: "Creche",)))),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.15,
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
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(cuid.nome,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text("${_calcularIdade(cuid.dataNasce!)} anos",
                        style: TextStyle(
                        ),),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text("$rua - $bairro, $cidade - $uf",
                        style: TextStyle(
                        ),),
                      ),
                      Container(height: MediaQuery.of(context).size.height * 0.01,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: RatingBarIndicator(
                          rating: somaAvalI.toDouble(),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: MediaQuery.of(context).size.width * 0.07,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context,index) {
                            switch (index){
                              case 0:
                              return Icon(Icons.sentiment_very_dissatisfied,color: Colors.red,);
                              case 1:
                              return Icon(Icons.sentiment_dissatisfied,color: Colors.redAccent,);
                              case 2:
                              return Icon(Icons.sentiment_neutral,color: Colors.orange,);
                              case 3:
                              return Icon(Icons.sentiment_satisfied,color: Colors.lightGreen,);
                              case 4:
                              return Icon(Icons.sentiment_very_satisfied,color: Colors.green,);
                              default: return Text("123");
                            }
                          },
                          ),
                      )
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
