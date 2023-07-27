import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';

class ServSolic_C extends StatefulWidget {
  const ServSolic_C({super.key});

  @override
  State<ServSolic_C> createState() => _ServSolic_CState();
}

class _ServSolic_CState extends State<ServSolic_C> {
  final List lst = ['um', 'dois', 'três', 'quatro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          WidBackground(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text('Solicitações', style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width * 0.08,
                              fontFamily: 'LilitaOne',
                            ),),
                          ],
                        ),
                        Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height * 0.01)),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.75,
                          color: Color.fromARGB(255, 124, 170, 248),
                          child: ListView.builder(
                            itemCount: lst.length,
                            itemBuilder: (context,Index){

                          }),
                        ),
                        Padding(
                                  padding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height * 0.01)),
                        MenuHorCuidador()
                      ],
                    ),
                  ),
                ],
              ),
            ],
          
        
      ),
    );
  }
}