import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemPet_C extends StatefulWidget {
  const ItemPet_C({super.key});

  @override
  State<ItemPet_C> createState() => _ItemPet_CState();
}

class _ItemPet_CState extends State<ItemPet_C> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
    child: Container(
       height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.1,
        color: Color.fromARGB(255, 147, 147, 147),
        child: Row(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
            color: Colors.brown,
            ),
            ),
            Column(children: [
              Container(height: MediaQuery.of(context).size.height * 0.035),
              Text("Nome",style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055
              ),),
              Text("Idade")
            ],)
        ]),
    ),
    );
  }
}