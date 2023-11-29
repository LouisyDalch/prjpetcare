import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_agenda.dart';

import '../../API/cuidadoresmet.dart';
import '../../Repositorios/cuidador_repos.dart';
//program

class LogadoCuidador extends StatefulWidget {
  const LogadoCuidador({super.key});

  @override
  State<LogadoCuidador> createState() => _LogadoCuidadorState();
}

class _LogadoCuidadorState extends State<LogadoCuidador> {
  CuidadorRepository cuidadorRepository = new CuidadorRepository();
  List<Servico> lst = [];

  Future<ListResult> getServicos() async {
    return await cuidadorRepository.puxarAgenda();
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
            valor: element["valor"],
            idStatus: element['idStatus'],
            idDono: element['idDono'],
            idCuidador: element['idCuidador'],
            idPet: element["idPet"],
            idTipoServ: element["idTipoServ"],
            donoNome: element['donoNome'],

            nomePet: element['nomePet'],));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        const WidBackground(),
        ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Agenda',
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.005,
                          color: const Color.fromRGBO(183, 183, 183, 1),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.34,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 192, 191, 191)
                              .withOpacity(0.45),
                          borderRadius: BorderRadius.circular(0)),
                      child: ListView.builder(
                          itemCount: lst.length,
                          
                          itemBuilder: (context, Index) {
                            Servico current = lst[Index];
                            return ItemList(servico: current,);
                          }),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.015)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Meus Serviços',
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.07),
                        ),
                        Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.01)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.005,
                          color: const Color.fromRGBO(183, 183, 183, 1),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.015)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(219, 114, 38, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/serv_solic_c');
                          },
                          child: Center(
                            child: Text(
                              'Solicitações',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045),
                            ),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.015)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(219, 114, 38, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/serv_confirm_c');
                          },
                          child: Center(
                            child: Text(
                              'Confirmados',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045),
                            ),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.015)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(219, 114, 38, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/serv_final_c');
                          },
                          child: Center(
                            child: Text(
                              'Finalizados',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.045),
                            ),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.04)),
                    const MenuHorCuidador()
                  ],
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
