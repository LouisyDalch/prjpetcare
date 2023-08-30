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
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.1,
        
        child: Column(
          children: [
            Container(height: MediaQuery.of(context).size.width * 0.04,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(width: MediaQuery.of(context).size.width * 0.04,),
                Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 7, 95, 27),
                  ),
                ),
                Container(width: MediaQuery.of(context).size.width * 0.04,),
                Text("Nome_Pet", style: 
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),)
              ],
            ),
            Container(height: MediaQuery.of(context).size.width * 0.03,),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.002,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
