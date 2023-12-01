import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_confirm_t.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';

import '../../API/tutoresmet.dart';
import '../../Elementos_design/Itens_lista/It_Tutor/item_solic_t.dart';
import '../../Repositorios/tutor_repos.dart';
//fazer
class ServSolic_T extends StatefulWidget {
  const ServSolic_T({super.key});

  @override
  State<ServSolic_T> createState() => _ServSolic_TState();
}

class _ServSolic_TState extends State<ServSolic_T> {

  TutorRopository tutorRepository = new TutorRopository();
  List<ServicoSolic> lst = [];

  Future<ListResult> getServicosSolic() async {
    return await tutorRepository.puxarServSolicTutor();
  }
  

  void loadServicos() async {
    ListResult servicos = await getServicosSolic();
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
                          'Solicitações',
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
                            return ItemSolicT(servico: a,);
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
