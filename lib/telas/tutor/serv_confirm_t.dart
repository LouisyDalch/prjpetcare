import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_confirm_t.dart';

import '../../API/tutoresmet.dart';
import '../../Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import '../../Repositorios/tutor_repos.dart';

class ServConf_T extends StatefulWidget {
  const ServConf_T({super.key});

  @override
  State<ServConf_T> createState() => _ServConf_TState();
}

class _ServConf_TState extends State<ServConf_T> {
  TutorRopository tutorRepository = new TutorRopository();
  List<ServicoSolic> lst = [];

  Future<ListResult> getServicosConf() async {
    return await tutorRepository.puxarServConfTutor();
  }
  

  void loadServicos() async {
    ListResult servicos = await getServicosConf();
    setState(() {
      lst = [];
      for (var element in servicos.resultados) {
        lst.add(ServicoSolic(
            idServ: element['idServ'],
            dataIni: DateTime.tryParse(element['dataIni']),
            dataFin: DateTime.tryParse(element['dataFin']),
            valor: element["valor"],
            idStatus: element['idStatus'],
            idDono: element['idDono'],
            idCuidador: element['idCuidador'],
            idPet: element["idPet"],
            idTipoServ: element["idTipoServ"],
            donoNome: element['donoNome'],
            dataDono: DateTime.tryParse(element["dataDono"]),
            nomePet: element['nomePet'],
            dataPet: DateTime.tryParse(element["dataPet"]),),);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadServicos();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Confirmados',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontFamily: 'LilitaOne',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.75,
                      //color: Color.fromARGB(255, 124, 170, 248),
                      child: ListView.builder(
                          itemCount: lst.length,
                          itemBuilder: (context, Index) {
                            ServicoSolic a = lst[Index];
                            return ItemConfirmT(servico: a,);
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    const MenuHorTutor()
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
