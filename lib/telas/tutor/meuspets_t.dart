import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/item_pet_t.dart';

class MeusPets_T extends StatefulWidget {
  const MeusPets_T({super.key});

  @override
  State<MeusPets_T> createState() => _MeusPets_TState();
}

class _MeusPets_TState extends State<MeusPets_T> {
  final List lst = [
    'um',
    'dois',
    'três',
    'quatro',
    'cinco',
    'seis',
    'sete',
    'oito'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children:<Widget> [
        const WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
              Text("Meus Pets", style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.07
              ),),
              Container(height: MediaQuery.of(context).size.height * 0.02,),
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.005,
                  color: Colors.black,
                ),
              Container(height: MediaQuery.of(context).size.height * 0.02,),
              GestureDetector(
                onTap: () => print("okk"),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(202, 202, 202, 1)
                  ),
                  child: Row(children: <Widget> [
                    Icon(Icons.add, size: MediaQuery.of(context).size.width * 0.1,),
                    Text("Adicionar Pet", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w600
                    ),)
                  ],),
                ),
              ),
              Container(height: MediaQuery.of(context).size.height * 0.02,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  //color: Colors.green
                  ),
                  child: ListView.builder(
                    itemCount: lst.length,
                    itemBuilder: (context, Index){
                      return const ItemPet_T();
                    }),
                ),
              
              Container(height: MediaQuery.of(context).size.height * 0.02,),
              const MenuHorTutor()
            ],),
          ],                                                                                                                                                               
        )
      ]),
    );
  }
}