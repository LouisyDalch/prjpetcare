import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:flutter/cupertino.dart';

import '../../Elementos_design/design.dart';

class EditarPerfPet_T extends StatefulWidget {
  const EditarPerfPet_T({super.key});

  @override
  State<EditarPerfPet_T> createState() => _EditarPerfPet_TState();
}

class _EditarPerfPet_TState extends State<EditarPerfPet_T> {
  _EditarPerfPet_TState(){
    _genSelect = generos[2];
  }
  final generos =["Feminino", "Masculino", "Desconhecido"];
  String? _genSelect = "";

  String nome = "";
  String dataNasce = "";
  String especie = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(
                                "defora/imagens/fundoperfpet_edt.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.white,
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          onChanged: (Text) {
                            Text = nome;
                          },
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: "",
                              labelText: "Nome/Apelido",
                              border: const OutlineInputBorder()),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    children: [
                      Text(
                        "Data de Nascimento",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                  ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      initialDateTime: DateTime.now(),
                      maximumDate: DateTime.now(),
                      backgroundColor: Color.fromARGB(255, 235, 234, 234),
                      onDateTimeChanged: (DateTime value) {
                        String dia = "";
                        String mess = "";
                        final day = value.day;
                        final mes = value.month;
                        final ano = value.year;
                        if (day < 10) {
                          dia = "0$day";
                        } else {
                          dia = "$day";
                        }
                        if (mes < 10) {
                          mess = "0$mes";
                        } else {
                          mess = "$mes";
                        }
                        dataNasce = "$dia/$mess/$ano";
                        print(dataNasce);
                        // Do something
                      },
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.85,
                    color: Colors.white,
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          onChanged: (Text) {
                            Text = especie;
                          },
                          autocorrect: false,
                          decoration: DesignEntradaTxt.decorarcaixa(
                              hintText: "",
                              labelText: "Espécie",
                              border: const OutlineInputBorder()),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: DropdownButton(
                      value: _genSelect,
                      items: generos.map(
                      (e){
                        return DropdownMenuItem(child: Text(e), value: e,);
                      }
                    ).toList(), 
                    onChanged: (val){
                      setState(() {
                        _genSelect = val as String;
                      });
                    },
                    
                    
                    
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
