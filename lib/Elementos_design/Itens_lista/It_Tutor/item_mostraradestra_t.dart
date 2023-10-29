import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemMostrarAdestraT extends StatefulWidget {
  const ItemMostrarAdestraT({super.key});

  @override
  State<ItemMostrarAdestraT> createState() => _ItemMostrarAdestraTState();
}

class _ItemMostrarAdestraTState extends State<ItemMostrarAdestraT> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width * 0.15,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:NetworkImage("https://img.freepik.com/vetores-premium/amigo-3d-pessoas-contato-perfil-simbolo-do-emblema-do-icone-do-usuario-pessoa-humano-simbolo-de-sinal-de-avatar_659151-934.jpg"))
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text('Maria Eduarda Expedita Oliveira Canto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text('Idade',
                      style: TextStyle(
                      ),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text('Localização',
                      style: TextStyle(
                      ),),
                    ),
                    Container(height: MediaQuery.of(context).size.height * 0.01,),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: RatingBarIndicator(
                        rating: 2.45,
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
                        ),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
