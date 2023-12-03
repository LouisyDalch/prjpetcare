import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:prjpetcare/telas/cuidador/editarperfil_c.dart';


import '../../API/cuidadoresmet.dart';


class Perfil_C extends StatefulWidget {
  const Perfil_C({super.key,});

  @override
  State<Perfil_C> createState() => _Perfil_CState();
}

class _Perfil_CState extends State<Perfil_C> {
  List<InfoCuid> lst=[];
  List<EndCuid> lst2=[];
  String nome= "";
  DateTime nasceu = DateTime.now();
  String email = "";
  String rua = "";
  String bairro = "";
  String cidade = "";
  double preco = 0;
  String uf = "";
  

   CuidadorRepository cuidadorRepository = CuidadorRepository();

   Future<ListResult> getInfoCuid() async {
    return await cuidadorRepository.puxarInfosCuid();
  }

  Future<ListResult> getEndCuid() async {
    return await cuidadorRepository.puxarEndCuidador();
  }

  final imagemPicker = ImagePicker();
  Uint8List? imageBytes;
  
  

  void loadImage() async {
    var bytes = await cuidadorRepository.pegarFoto();
    setState(() => {imageBytes = bytes});
  }

  @override
  void initState() {
    super.initState();
    loadInfos();
    loadEndereco();
    loadImage();
  }

  void loadInfos() async {
    ListResult infos = await getInfoCuid();
    setState(() {
      for (var element in infos.resultados) {
        lst = [];
         lst.add(InfoCuid(
            idCuidador: element['id_cuidador'],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element["datanasce"]),
            telefone: element["telefone"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"],
            especializacao: element["especializacao"],
            tempoExper: element["tempoexper"],
            valor: element["valor"],
            idEnd: element["id_end"],
            idTipoServ: element["id_tipoServ"],
            idTipoPet: element["id_TipoPet"],
            idAgenda: element["id_Agenda"]));
      }
      InfoCuid a = lst[0];
      nome = a.nome;
      nasceu = a.dataNasce!;
      email = a.email;
      preco = a.valor;
    });
    
   
  }

  void loadEndereco() async {
    ListResult end = await getEndCuid();
    setState(() {
      for (var element in end.resultados) {
        lst2 = [];
         lst2.add(EndCuid(
            idEndereco: element["idEndereco"],
            rua: element["rua"],
            bairro: element["bairro"],
            num: element["num"],
            comple: element["comple"],
            cep: element["cep"],
            cidade: element["cidade"],
            uf: element["uf"]
            ));
      }
      EndCuid a = lst2[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
    
   
  }

  int _calcularIdade (DateTime dataNasceu){
    DateTime verifica = DateTime(DateTime.now().year, dataNasceu.month,dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    if(DateTime.now().isBefore(verifica)){
      idade = hoje.year - dataNasceu.year - 1;
    }else{
      idade = hoje.year - dataNasceu.year;
    }
    return idade;
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage("defora/imagens/fundoperfilC.png"),
                            fit: BoxFit.fill)),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'Configurações',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.009)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.width * 0.005,
                    color: Colors.black,
                  ),
                  Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.015)),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.push(
              context, 
              MaterialPageRoute(builder: (
                (context) => EditarPerfilC())));
                    }, //programação
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(children: [
                        Icon(
                          Icons.person,
                          size: MediaQuery.of(context).size.height * 0.06,
                        ),
                        Text(
                          "Editar Perfil",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.0001,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/editar_agenda_c'), //programação
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Row(children: [
                        Icon(
                          Icons.calendar_month,
                          size: MediaQuery.of(context).size.height * 0.06,
                          weight: 200,
                        ),
                        Text(
                          "Editar Agenda",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.height * 0.025,
                          ),
                        )
                      ]),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.3)),
                      GestureDetector(
                        onTap: () => print("uiiii"), //programação
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: Row(children: [
                            Icon(
                              Icons.exit_to_app_rounded,
                              size: MediaQuery.of(context).size.height * 0.03,
                              weight: 200,
                            ),
                            Text(
                              "Sair",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.025,
                              ),
                            )
                          ]),
                        ),
                      ),
                    ],
                  ),
                  const MenuHorCuidador()
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(nome,//kkkkkkkkkkkkk
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.055,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Text("${_calcularIdade(nasceu)} anos",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                          image: imageBytes != null
                    ? DecorationImage(
                        image: MemoryImage(imageBytes!),
                        fit: BoxFit.cover,
                    )
                      : null,
                          //colocar imagem
                        ),
                      ),
                      Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Column(children: [
                          Text("$rua - $bairro, $cidade - $uf",
                          textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(email,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                        ],),
                      ),
                      
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.516,
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}
