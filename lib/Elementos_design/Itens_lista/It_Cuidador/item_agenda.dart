import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import '../../../Repositorios/cuidador_repos.dart';
//program
class ItemList extends StatefulWidget {
  final Servico servico;

  const ItemList({
    super.key,
    required this.servico,});

  @override
  State<ItemList> createState() => _ItemListState(servico: servico);
}

class _ItemListState extends State<ItemList> {
  Servico servico;

  _ItemListState({
      required this.servico,
    }) : super();

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
                servico.tipoServ,
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
