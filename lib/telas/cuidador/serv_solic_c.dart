import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prjpetcare/API/cuidadoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';


import '../../Elementos_design/Itens_lista/It_Cuidador/item_solic_c.dart';
//ref
class ServSolic_C extends StatefulWidget {
  const ServSolic_C({super.key});

  @override
  State<ServSolic_C> createState() => _ServSolic_CState();
}
//cola
class _ServSolic_CState extends State<ServSolic_C> {
  CuidadorRepository cuidadorRepository = new CuidadorRepository();
  List<ServicoSolic> lst = [];

  Future<ListResult> getServicosSolic() async {
    return await cuidadorRepository.puxarServicosSolic();
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
                          itemBuilder: (context, index) {
                            ServicoSolic current = lst[index];
                            return ItemSolicC(
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
