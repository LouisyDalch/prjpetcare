import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemPet_T extends StatefulWidget {
  const ItemPet_T({super.key});

  @override
  State<ItemPet_T> createState() => _ItemPet_TState();
}

class _ItemPet_TState extends State<ItemPet_T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.05,
        color: Colors.blueGrey,
        ),
      );
   
  }
}