import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

import '../../API/cuidadoresmet.dart';
import '../../Elementos_design/Itens_lista/It_Cuidador/item_confirm_c.dart';
import '../../Repositorios/cuidador_repos.dart';

class ServConfirm_C extends StatefulWidget {
  const ServConfirm_C({super.key});

  @override
  State<ServConfirm_C> createState() => _ServConfirm_CState();
}

class _ServConfirm_CState extends State<ServConfirm_C> {
  CuidadorRepository cuidadorRepository = CuidadorRepository();
  List<ServicoSolic> lst = [];
//aaaaaa
  Future<ListResult> getServicos() async {
    return await cuidadorRepository.puxarServConf();
  }

  @override
  void initState() {
    super.initState();
    loadServicos();
  }

 void loadServicos() async {
    ListResult servicos = await getServicos();
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
                          itemBuilder: (context, index) {
                            ServicoSolic current = lst[index];
                            return ItemConfirmC(
                              servico: current,
                            );
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    const MenuHorCuidador()
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
