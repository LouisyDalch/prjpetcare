import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/API/tutoresmet.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_mostrarcreche_t.dart';

import '../../Elementos_design/design.dart';
import '../../Elementos_design/Itens_lista/It_Tutor/item_feedback_cuid_t.dart';
import '../../Repositorios/tutor_repos.dart';

class MostrarServCreche_T extends StatefulWidget {
  const MostrarServCreche_T({super.key});

  @override
  State<MostrarServCreche_T> createState() => _MostrarServCreche_TState();
}

class _MostrarServCreche_TState extends State<MostrarServCreche_T> {
  String pesquisa = "";
  
  TutorRopository tutorRopository = TutorRopository();
  List<InfoCuidP> lst = [];
//aaaaaa
  Future<ListResult> getInfoCuid() async {
    return await tutorRopository.puxarCuidCreche();
  }

  @override
  void initState() {
    super.initState();
    loadInfos();
  }

  void loadInfos() async {
    ListResult infos = await getInfoCuid();
    setState(() {
              lst = [];
      for (var element in infos.resultados) {

         lst.add(InfoCuidP(
            idCuidador: element['id_cuidador'],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element["datanasce"]),
            telefone: element["telefone"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"],
            especializacao: element["especializacao"],
            tempoExper: element["tempoexper"],
            valor: element["valor"],
            idEnd: element["id_end"],
            idTipoServ: element["id_tipoServ"],
            idTipoPet: element["id_TipoPet"],
            idAgenda: element["id_Agenda"]));
      }
    });
    //
   
   print(lst.length);
  }



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
                    child: Text("Creche", style: TextStyle(
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
                                  InfoCuidP a = lst[Index];
                                  return ItemMostrarCrecheT(cuid: a,);
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
