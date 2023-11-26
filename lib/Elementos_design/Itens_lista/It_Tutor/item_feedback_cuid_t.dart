import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../../API/tutoresmet.dart';

class ItemFeedback_T extends StatefulWidget {
  final FeedbackTutor feedback;
  const ItemFeedback_T({super.key,
  required this.feedback});

  @override
  State<ItemFeedback_T> createState() => _ItemFeedback_TState(feedback: feedback, tutorRopository: TutorRopository());
}

class _ItemFeedback_TState extends State<ItemFeedback_T> {
  FeedbackTutor feedback;
  TutorRopository tutorRopository;
  List<TutorByCuid> lstTutor = [];
  int _registro = 0;

  String nome = "";

  _ItemFeedback_TState({
    required this.feedback,
    required this.tutorRopository
  }): super();

  Future<ListResult> getTutor() async {
    return await tutorRopository.puxarDadosTutores(feedback.idTutor.toString());
  }

  void _handleRating(int rating) {
    setState(() {
      _registro = rating;
    });
  }

   void initState() {
    super.initState();
    loadTutor();
    
  }

  void loadTutor() async {
    ListResult tipoServico = await getTutor();
    setState(() {
      lstTutor = [];
      for (var element in tipoServico.resultados) {
        lstTutor.add(
          TutorByCuid(
             idTutor: element["idDono"],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element['dataNasc']),
            cell: element["cell"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"] ),
        );
      }
      TutorByCuid t = lstTutor[0];
      nome = t.nome;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Column(children: [
            Container(
                        height: MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Text(nome, style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  
                  Text(feedback.data != null ?
                      DateFormat('dd/MM/yyyy').format(feedback.data!) 
                      : 'Data inválida',style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),)
                ],
              )
              ),
              Container(
                        height: MediaQuery.of(context).size.height * 0.01),
              Container(
                child: Row(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [RatingBarIndicator(
                          rating: feedback.aval.toDouble(),
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: MediaQuery.of(context).size.width * 0.07,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4),
                          itemBuilder: (context,index) {
                            switch (index){
                              case 0:
                              return Icon(Icons.sentiment_very_dissatisfied,color: Colors.red,);
                              case 1:
                              return Icon(Icons.sentiment_dissatisfied,color: Colors.redAccent,);
                              case 2:
                              return Icon(Icons.sentiment_neutral,color: Colors.orange,);
                              case 3:
                              return Icon(Icons.sentiment_satisfied,color: Colors.lightGreen,);
                              case 4:
                              return Icon(Icons.sentiment_very_satisfied,color: Colors.green,);
                              default: return Text("123");
                            }
                          },
                          ),]
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.27,
                    )
                  ],
                ),
              ),
              Container(
                        height: MediaQuery.of(context).size.height * 0.01),
              Container(
                 width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  feedback.coment)
                  ),
              Container(
                        height: MediaQuery.of(context).size.height * 0.02),
          ],)
        ]),
      ),
    );
  }
}
