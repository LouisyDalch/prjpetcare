import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_feedback_cuid_t.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_final_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Cuidador/item_pet_c.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_pet_t.dart';

class VisualCuidador_T extends StatefulWidget {
  const VisualCuidador_T({super.key});

  @override
  State<VisualCuidador_T> createState() => _VisualCuidador_TState();
}

class _VisualCuidador_TState extends State<VisualCuidador_T> {
  final lst = ["um", "2", "três"];
  bool abra = false;
  String cancelam = "";
  //fundovistut
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (!abra) {
          final conf = await showCancelDialog();
          print(conf);
          return conf ?? false;
        }
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            WidBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "defora/imagens/fundoperfilcuidT.png"),
                                fit: BoxFit.cover)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.brown),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.05,
                            child: ElevatedButton(
                              onPressed: () {
                                abra = true;
                                showCancelDialog();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 194, 25, 3),
                              ),
                              child: Text(
                                'Denunciar',
                                style: TextStyle(
                                    fontFamily: 'LilitaOne',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.05,
                                    color: Color.fromARGB(255, 10, 10, 10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Text("Preço: R\$10,00/hora"),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 168, 168, 168),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.07,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/criarcontacuidador');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 9, 153, 26),
                                ),
                                child: Text(
                                  'Solicitar',
                                  style: TextStyle(
                                      fontFamily: 'LilitaOne',
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      color: Color.fromARGB(255, 10, 10, 10)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Maria Eduarda Expedita Oliveira Canto",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Tantos anos",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(
                                  "Localização",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Brooklyn, Rua das Maritacas, 603",
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Dias disponíveis",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Domingo",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(0),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Segunda",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Terça",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Quarta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Quinta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Sexta",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Sábado",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Cuido de...",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Cães",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Gatos",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Roedores",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Aves",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Peixes",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.width * 0.01),
                                  child: Text(
                                    "Outros",
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                  decoration: BoxDecoration(
                                      color: disponivel(1),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Formas de contato",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "(11) 97654-0988",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "loulou@gmail.com",
                                          style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromARGB(212, 42, 162, 24)),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.chat_sharp,
                                          color: Color.fromRGBO(28, 73, 25, 1),
                                        ),
                                        iconSize:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              Color.fromRGBO(205, 205, 205, 1).withOpacity(0.9),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Avaliações",
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.055,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: lst.length,
                                itemBuilder: (context, Index) {
                                  return const ItemFeedback_T();
                                }),
                          ],
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.15),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.88,
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
                child: MenuHorTutor(),
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.width * 0.063,
                    top: MediaQuery.of(context).size.width * 0.03,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color disponivel(int t) {
    if (t == 0) {
      return Color.fromARGB(255, 168, 168, 168);
    } else {
      return Colors.green;
    }
  }

  Future<bool?> showCancelDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Deseja realmente cancelar o serviço?"),
            actions: [
              Container(
                color: Colors.white,
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      maxLines: 3,
                      onChanged: (Text) {
                        cancelam = Text;
                      },
                      autocorrect: false,
                      decoration: DesignEntradaTxt.decorarcaixa(
                          hintText: "",
                          labelText: "Por que deseja denunciar?",
                          border: const OutlineInputBorder()),
                    ),
                  ],
                )),
              ),
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("Não")),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("Sim"))
            ],
          );
        });
  }
}
