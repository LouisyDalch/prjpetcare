import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../API/tutoresmet.dart';

class PerfilTutor extends StatefulWidget {
  const PerfilTutor({super.key});

  @override
  State<PerfilTutor> createState() => _PerfilTutorState();
}

class _PerfilTutorState extends State<PerfilTutor> {

  TutorRopository tutorRopository = TutorRopository();
  List <TutorByCuid> lstTutor = [];
  List<EndTutor> lstEnd=[];

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.44,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("defora/imagens/fundoperfilT.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
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
                        MediaQuery.of(context).size.height * 0.005)),
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed('/meuspet_t'), //programação
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(children: [
                      Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.12)),
                      Icon(
                        Icons.pets,
                        size: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Meus Pets",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      )
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed('/editar_perfil_t'), //programação
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(children: [
                     Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.12)),
                      Icon(
                        Icons.person,
                        size: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Editar Perfil",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.025,
                        ),
                      ),
                      
                    ]),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/meuhist_t'), //programação
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(children: [
                       Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.12)),
                      Icon(
                        Icons.calendar_month,
                        size: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Histórico",
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
                const MenuHorTutor()
              ],
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
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(nome,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Text("${_calcularIdade(dataNasc)} anos",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration:  BoxDecoration(
                          color: Colors.brown,
                          shape: BoxShape.circle,
                          image: imageBytes != null
                    ? DecorationImage(
                        image: MemoryImage(imageBytes!),
                        fit: BoxFit.cover,
                    )
                      : null,
                        ),
                      ),
                      Container(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                      Container(
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width *0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.3),
                        ),
                        child: Column(
                          children: [
                            Text("$rua - $bairro, $cidade - $uf",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold,
                        
                      ),textAlign: TextAlign.center,
                     ),
                      Text(email,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.055,
                        fontWeight: FontWeight.bold
                      ),),
                          ],
                        ),
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

  //VARIAVEIS LOCAIS
  String nome = "";
  DateTime dataNasc = DateTime.now();
  String email = "";

  String rua = "";
  String bairro = "";
  String cidade = "";
  String uf = "";

  Future<ListResult> getTutor() async {
    return await tutorRopository.puxarMeusDadosTutor();
  }

  Future<ListResult> getEnd() async {
    return await tutorRopository.puxarMeuEndTutor();
  }
  
  @override
  void initState() {
    super.initState();
    loadTutor();
    loadEndereco();
    loadImage();
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
      dataNasc = t.dataNasce!;
      email = t.email;
    });
  }

  void loadEndereco() async {
    ListResult end = await getEnd();
    setState(() {
      for (var element in end.resultados) {
        lstEnd = [];
         lstEnd.add(EndTutor(
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
      EndTutor a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });

  }
  
  final imagemPicker = ImagePicker();
  Uint8List? imageBytes;

  void loadImage() async {
    var bytes = await tutorRopository.pegarMinhaFoto();
    setState(() => {imageBytes = bytes});
  

  }

}