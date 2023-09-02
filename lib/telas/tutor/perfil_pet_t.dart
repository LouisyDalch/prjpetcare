import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

class PerfilPet_T extends StatefulWidget {
  const PerfilPet_T({super.key});

  @override
  State<PerfilPet_T> createState() => _PerfilPet_TState();
}

class _PerfilPet_TState extends State<PerfilPet_T> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const WidBackground(),
        Column(children: [
          
        ],),
      ]),
    );
  }
}