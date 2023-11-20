import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
//a
import '../../API/cuidadoresmet.dart';

class VisualServConf extends StatefulWidget {
  final int idPet;
  final int idDono;
  final int idServ;
  const VisualServConf({super.key,
  required this.idPet,
  required this.idDono,
  required this.idServ});

  @override
  State<VisualServConf> createState() => _VisualServConfState(
    idPet: idPet, idDono: idDono, idServ: idServ, cuidadorRepository: CuidadorRepository());
}

class _VisualServConfState extends State<VisualServConf> {
  bool abra = false;
  CuidadorRepository cuidadorRepository;
  List<petCuid> lst = [];
  List<TutorByCuid> lstTutor = [];
  List<EndCuid> lstEnd = [];
  int idPet;
  int idDono;
  int idServ;

  String nome = "";
  //int idade = 0;
  DateTime dataNasce1 = DateTime.now();

  String nomeTutor = "";
  DateTime dataNasceTut = DateTime.now();

      String rua = "";
      String bairro = "";
      String cidade ="";
      String uf = "";

  _VisualServConfState({
    required this.idPet,
    required this.idDono,
    required this.idServ,
    
    required this.cuidadorRepository,
  }) :super();

  Future<ListResult> getPet() async {
    return await cuidadorRepository.puxarPetCuid(idPet.toString());
  }

  Future<ListResult> getTutor() async {
    return await cuidadorRepository.puxarTutorCuid(idDono.toString());
  }

  Future<ListResult> getEndTutor() async {
    return await cuidadorRepository.puxarEndTutorCuid(idDono.toString());
  }

  @override
  void initState() {
    super.initState();
    loadPet();
    loadTutor();
    loadEndereco();
    //_loadImage();
  }

  void loadPet() async {
    ListResult pet = await getPet();
    setState(() {
      lst = [];
      for (var element in pet.resultados) {
        lst.add(petCuid(
            idPet: element['idPet'],
            nome: element["nome"],
            dataNasce: DateTime.tryParse(element['data']),
            raca: element["raca"],
            sexo: element["sexo"],
            peso: element["peso"],
            porte: element["porte"],
            vacinacao: element['vacinacao'],
            descricao: element['descricao'],
            idDono: element["idDono"],
            idTipoPet: element["idTipoPet"]),);
      }
      petCuid petA = lst[0];
      nome = petA.nome;
      dataNasce1 = petA.dataNasce!;
    });
  }

  void loadTutor() async {
    ListResult tutor = await getTutor();
    setState(() {
      lstTutor = [];
      for (var element in tutor.resultados) {
        lstTutor.add(TutorByCuid(
            idTutor: element["idDono"],
            nome: element["nome"],
            email: element["email"],
            dataNasce: DateTime.tryParse(element['dataNasc']),
            cell: element["cell"],
            cpf: element["cpf"],
            genero: element["genero"],
            senha: element["senha"]));
      }
      TutorByCuid tutorA =lstTutor[0];
      nomeTutor = tutorA.nome;
      dataNasceTut = tutorA.dataNasce!;
    });
  }

  void loadEndereco() async {
    ListResult end = await getEndTutor();
    setState(() {
      lstEnd = [];
      for (var element in end.resultados) {
        lstEnd.add(EndCuid(
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
      EndCuid a = lstEnd[0];
      rua = a.rua;
      bairro = a.bairro;
      cidade = a.cidade;
      uf = a.uf;
    });
  }

  String _calcularIdade (DateTime dataNasceu){
    DateTime verifica = DateTime(DateTime.now().year, dataNasceu.month,dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    int mes;
    if(DateTime.now().isBefore(verifica)){
      idade = hoje.year - dataNasceu.year - 1;
    }else{
      idade = hoje.year - dataNasceu.year;
    }
    String a;
    
    if(idade>0){
      a = "$idade anos";
    }else{
      //calcular meses
      int mes = hoje.month - dataNasceu.month;
      if(mes>1){
        a = "$mes meses";
      }else{
        if(hoje.day>dataNasceu.day){
          a = "$mes mês";
        }else{
          final mds = hoje.difference(dataNasceu).inDays;
          a = "$mds dias";
        }
      }
    }
    
    return a;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ 
        if(!abra){
          final conf = await showConfDialog();
          print(conf);
          return conf ?? false;
        }
        return true;
       },
      child: Scaffold(
        body: Stack(
          children: [
            WidBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Serviço Confirmado",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.06),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(143, 153, 153, 153),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Sobre o tutor",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width * 0.05),
                              )),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.15,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 114, 38, 1),
                                    shape: BoxShape.circle),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.47,
                                    child: Text(
                                      nomeTutor,
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("${_calcularIdade(dataNasceTut)}")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("$rua - $bairro, $cidade - $uf")),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: GestureDetector(
                                        onTap: () => Navigator.of(context).pushNamed('/visualizacao_tutor_c'),
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(219, 114, 38, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                children: [
                                  Text(
                                    "Sobre o pet",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                  ),
                                ],
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: MediaQuery.of(context).size.height * 0.12,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(219, 114, 38, 1),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text(
                                        nome,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.47,
                                      child: Text("${_calcularIdade(dataNasce1)}")),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context).pushNamed('/visualizacao_pet_c'),
                                    child: Container(
                                        width: MediaQuery.of(context).size.width *
                                            0.47,
                                        child: Text(
                                          "Saber mais",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(219, 114, 38, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.045),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.004,
                            width: MediaQuery.of(context).size.width * 0.85,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Modalidade: Creche",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Início: 14/12/2024 às 14:30",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Término: 14/12/2024 às 15:00",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                              Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                "Precificação total: R\$ 23,00",
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              )),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: ElevatedButton(
                                  onPressed: () {
                                    //Programação
                                    //if antes do tempo final, desabilita
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 0, 157, 16),
                                  ),
                                  child: Text(
                                    'Finalizar',
                                    style: TextStyle(
                                        fontFamily: 'LilitaOne',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color:
                                            Color.fromARGB(255, 231, 231, 231)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.19,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.06,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    abra = true;
                                    showConfDialog();
                                    /*final conf = await showConfDialog();
                                    print(conf);*/
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 157, 0, 0),
                                  ),
                                  child: Text(
                                    'Cancelar',
                                    style: TextStyle(
                                        fontFamily: 'LilitaOne',
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        color:
                                            Color.fromARGB(255, 231, 231, 231)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          
                          Container(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                              child: Text("O serviço não pode ser cancelado 24 horas antes de seu início")
                            ),
                    Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                    MenuHorCuidador()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> showConfDialog(){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Deseja realmente cancelar o serviço?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), 
          child: Text("Não")),
           TextButton(onPressed: () => Navigator.pop(context,true), 
          child: Text("Sim"))
        ],
      );
    });
  }

}


