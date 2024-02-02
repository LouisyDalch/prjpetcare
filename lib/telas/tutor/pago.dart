import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';

class FoiPago extends StatefulWidget {
  
  
  

  const FoiPago({super.key,
 });

  @override
  State<FoiPago> createState() => _FoiPagoState();
}

class _FoiPagoState extends State<FoiPago> {
 
 

 String formata(){
    DateTime hoje = DateTime.now();
  var formatter = new DateFormat("dd/MM/yyyy hh:mm");
  String data = formatter.format(hoje);
  return data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("Pagamento Realizado",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontWeight: FontWeight.bold
                ),),
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("Valor: R\$300.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),),
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
                Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("${formata()}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                ),),
                
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
                Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.001,
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
                Row(
                  children: [

                    Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("Destinatário: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.bold
                    ),),),
                    
                  ],
                ),
                Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("Pedro Cauã Silva Alves",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                ),),
                ),
                Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("CPF: 976.***.564-**",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                ),),
                ),
                Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),


                Row(
                  children: [

                    Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text("Remetente: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.055,
                      fontWeight: FontWeight.bold
                    ),),),
                    
                  ],
                ),
                Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("Louisy Dalchiavon Tomazi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                ),),
                ),
                Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Text("CPF: 316.***.468-**",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                ),),
                ),
            ],),
          ],
        )
      ]),
    );
  }
}