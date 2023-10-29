import 'package:flutter/material.dart';
import 'package:prjpetcare/API/cuidadoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

import '../../Elementos_design/Itens_lista/It_Cuidador/item_solic_c.dart';

class ServSolic_C extends StatefulWidget {
  const ServSolic_C({super.key});

  @override
  State<ServSolic_C> createState() => _ServSolic_CState();
}

class _ServSolic_CState extends State<ServSolic_C> {
  CuidadorRepository cuidadorRepository = new CuidadorRepository();
  List<Servico> lst = [];

  Future<ListResult> getServicos() async {
    return await cuidadorRepository.puxarServicos();
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
        lst.add(Servico(
            idServ: element['idServ'],
            dataIni: DateTime.tryParse(element['dataIni']),
            dataFin: DateTime.tryParse(element['dataFin']),
            idDono: element['idDono'],
            idCuidador: element['idCuidador'],
            donoNome: element['donoNome'],
            idStatus: element['idStatus'],
            tipoServ: element['tipoServ'],
            nomePet: element['nomePet']));
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
                            Servico current = lst[index];
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
