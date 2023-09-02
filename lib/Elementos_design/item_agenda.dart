import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
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
                'Hospedagem',
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
                Text('Nome_cuidador', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04)),
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.017)),
                Text('Data_Serv', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04))
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.007)),
                Text('Nome_Pet', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
