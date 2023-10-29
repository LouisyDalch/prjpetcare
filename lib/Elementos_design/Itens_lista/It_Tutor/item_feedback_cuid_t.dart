import 'package:flutter/material.dart';

class ItemFeedback_T extends StatefulWidget {
  const ItemFeedback_T({super.key});

  @override
  State<ItemFeedback_T> createState() => _ItemFeedback_TState();
}

class _ItemFeedback_TState extends State<ItemFeedback_T> {
  int _registro = 0;

  void _handleRating(int rating) {
    setState(() {
      _registro = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 1; i <= 5; i++) {
      IconData starIcon = _registro >= i ? Icons.star : Icons.star_border;
      stars.add(
        GestureDetector(
          //quando c for programar, tira o gesture detector e coloca o valor ali no _rating
          onTap: () {
            _handleRating(i);
          },
          child: Icon(starIcon, color: Colors.amber, size: MediaQuery.of(context).size.width *0.07),
        ),
      );
    }

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
                    child: Text("Maria Eduarda Expedita Oliveira Canto", style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  
                  Text("12/04/2022",style: TextStyle(
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
                        children: stars,
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                    )
                  ],
                ),
              ),
              Container(
                        height: MediaQuery.of(context).size.height * 0.01),
              Container(
                 width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                  ),
              Container(
                        height: MediaQuery.of(context).size.height * 0.02),
          ],)
        ]),
      ),
    );
  }
}
