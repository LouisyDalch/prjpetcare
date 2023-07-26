import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/item.dart';

class LogadoCuidador extends StatefulWidget {
  const LogadoCuidador({super.key});

  @override
  State<LogadoCuidador> createState() => _LogadoCuidadorState();
}

class _LogadoCuidadorState extends State<LogadoCuidador> {
  final List lst = [
    'um',
    'dois',
    'três',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        WidBackground(),
        ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Agenda', 
                        style: TextStyle( fontFamily: 'LilitaOne', fontSize: MediaQuery.of(context).size.width * 0.07),),
                        Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.005,
                          color: Color.fromRGBO(219, 114, 38, 1),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.01)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(0)
                      ),
                      child: ListView.builder(itemCount: lst.length ,itemBuilder: (context,Index) ),
                    ),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    ));
  }
}
