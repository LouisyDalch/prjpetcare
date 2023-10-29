import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

import '../../Elementos_design/Itens_lista/It_Tutor/item_mostraradestra_t.dart';
import '../../Elementos_design/design.dart';

class MostrarServAdestra_T extends StatefulWidget {
  const MostrarServAdestra_T({super.key});

  @override
  State<MostrarServAdestra_T> createState() => _MostrarServAdestra_TState();
}

class _MostrarServAdestra_TState extends State<MostrarServAdestra_T> {
  String pesquisa = "";
  final lst = ["um", "2", "três"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(height: MediaQuery.of(context).size.height * 0.06,),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.7,
                        color: Color.fromARGB(255, 224, 224, 224),
                        child: Form(
                            child: Column(
                          children: [
                            TextFormField(
                              onChanged: (Text) {
                                Text = pesquisa;
                              },
                              autocorrect: false,
                              decoration: DesignEntradaTxt.decorarcaixa(
                                hintText: "",
                                labelText: "",
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(width: MediaQuery.of(context).size.width * 0.05,),
                       Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                        ),
                         child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                            color: Colors.black,
                          ),
                       ),
                      
                    ],
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.04,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("Adestramento", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07
                    ),),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: lst.length,
                                itemBuilder: (context, Index) {
                                  return const ItemMostrarAdestraT();
                                }),
                  ),
                  Container(height: MediaQuery.of(context).size.height * 0.015,),
                  MenuHorTutor()
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}
