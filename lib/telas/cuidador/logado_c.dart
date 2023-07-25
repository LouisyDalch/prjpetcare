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
      children:[
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.amber,
                  
                  )
                ],
      ),
              ],
            ),
          ],
        ),]
    ),
    );
  }
}
