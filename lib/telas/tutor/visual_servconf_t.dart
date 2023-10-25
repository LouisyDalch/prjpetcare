import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

class VisualServConf_T extends StatefulWidget {
  const VisualServConf_T({super.key});

  @override
  State<VisualServConf_T> createState() => _VisualServConf_TState();
}

class _VisualServConf_TState extends State<VisualServConf_T> {
  bool abra = false;


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ 
        if(!abra){
          final conf = await showConfDialog();
          print(conf);
          return conf ?? false;
        }
        return true;
       },
      child: Scaffold(
        body: Stack(
          children: [
            WidBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Serviço Confirmado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(143, 153, 153, 153),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Sobre o cuidador",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(8, 105, 16, 1),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.47,
                                    child: Text(
                                      "Maria Eduarda Expedita Oliveira Canto",
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Idade")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Localização")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context).pushNamed('/visualizacao_tutor_c'),
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(8, 105, 16, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Text(
                                    "Meu pet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(8, 105, 16, 1),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                        "Nome",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("Idade")),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pushNamed('/visualizacao_pet_c'),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.47,
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(8, 105, 16, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Modalidade: Creche",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Início: 14/12/2024 às 14:30",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Término: 14/12/2024 às 15:00",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                              Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Precificação total: R\$ 23,00",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    abra = true;
                                    showConfDialog();
                                    /*final conf = await showConfDialog();
                                    print(conf);*/
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 157, 0, 0),
                                  ),
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        fontFamily: 'LilitaOne',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color:
                                            Color.fromARGB(255, 231, 231, 231)),
                                  ),
                                ),
                              ),
                          
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                              child: Text("O serviço não pode ser cancelado 24 horas antes de seu início")
                            ),
                    Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                    MenuHorTutor()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> showConfDialog(){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Deseja realmente cancelar o serviço?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), 
          child: Text("Não")),
           TextButton(onPressed: () => Navigator.pop(context,true), 
          child: Text("Sim"))
        ],
      );
    });
  }

}


