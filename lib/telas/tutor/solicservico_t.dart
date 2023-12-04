import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../API/tutoresmet.dart';

class SolicServico extends StatefulWidget {
  final int idCuid;
  final String nome;
  final String tipoServ;
  final double valor;

  const SolicServico({super.key,
  required this.idCuid,
  required this.nome,
  required this.tipoServ,
  required this.valor});

  @override
  State<SolicServico> createState() => _SolicServicoState(
    idCuid: idCuid, nome: nome, tipoServ: tipoServ,valor: valor, tutorRopository: TutorRopository(),);
}

class _SolicServicoState extends State<SolicServico> {
  int idCuid;
  String nome;
  String tipoServ;
  double valor;
  TutorRopository tutorRopository;

  

  List<PetTutor> lstPets = [];

  Future<ListResult> getPetsDoTutor() async {
    return await tutorRopository.puxarPetsDoTutor();
  }

   @override
  void initState() {
    super.initState();
    loadPets();
  }

  _SolicServicoState({
    required this.idCuid,
    required this.nome,
    required this.tipoServ,
    required this.valor,
    required this.tutorRopository,
  }) {
   

  }
  TimeOfDay horaServInicio = TimeOfDay.now();
  TimeOfDay horaServFim = TimeOfDay.now();
  DateTime dataInicio = DateTime.now();
  String dattaInicio = "";
  DateTime dataFim = DateTime.now();
  String dattaFim = "";
  double valTotal = 0.0;
  int idPet = 1;

  final portes = ["Selecionar pet"];
  String _portSelect = "";

  //PROGRAMAÇÃO BD ---------------------------------------


  void loadPets() async {
    ListResult infos = await getPetsDoTutor();
    setState(() {
      lstPets = [];
      for (var element in infos.resultados) {
        lstPets.add(PetTutor(
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
            idTipoPet: element["idTipoPet"]));
      }

          _portSelect = lstPets[0].nome;
          idPet = lstPets[0].idPet;
     
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Text(
                      "Solicitar Serviço",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width * 0.07),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          children: [
                            Text(
                              "Cuidador: ",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.59,
                              child: Text(
                                nome,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width *
                                        0.055),
                              ),
                            ),
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: Row(
                          children: [
                            Text(
                              "Serviço: ",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              tipoServ,
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055),
                            ),
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: DropdownButtonFormField(
                            value: _portSelect,
                            items: lstPets.map((e) {
                              return DropdownMenuItem(
                                child: Text(e.nome),
                                value: e.nome,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _portSelect = val.toString();
                                for(int x = 0; x<=lstPets.length;x++){
                                  if(_portSelect==lstPets[x].nome){
                                    idPet = lstPets[x].idPet;
                                    print("la $idPet");
                                    break;
                                  }
                                  
                                }
                                
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_circle,
                              color: Color.fromRGBO(8, 113, 26, 1),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.25,
                        )
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 8, 82, 10).withOpacity(0.8),
                      ),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Text(
                              "Selecione data e hora de início",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  color: Color.fromARGB(255, 11, 42, 13)),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: ElevatedButton(
                                  onPressed: () => _selectDateInicio(context),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(7, 125, 27, 1)),
                                  child: Text(
                                    DateFormat("dd/MM/yyyy").format(dataInicio),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Color.fromARGB(255, 3, 65, 9)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                  onPressed: () => _selectTimeInicio(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(7, 125, 27, 1),
                                  ),
                                  child: Text(
                                    mostrarHoraIni(horaServInicio),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Color.fromARGB(255, 3, 65, 9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 8, 121, 12).withOpacity(0.8),
                      ),
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: Text(
                              "Selecione data e hora de término",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.055,
                                  color: Color.fromARGB(255, 11, 42, 13)),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.45,
                                height: MediaQuery.of(context).size.height * 0.07,
                                child: ElevatedButton(
                                  onPressed: () => _selectDateFinal(context),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(19, 113, 33, 1)),
                                  child: Text(
                                    DateFormat("dd/MM/yyyy").format(dataFim),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Color.fromARGB(255, 3, 65, 9)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height: MediaQuery.of(context).size.height * 0.05,
                                child: ElevatedButton(
                                  onPressed: () => _selectTimeFinal(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromRGBO(19, 113, 33, 1),
                                  ),
                                  child: Text(
                                    mostrarHoraIni(horaServFim),
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        color: Color.fromARGB(255, 3, 65, 9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Row(
                        children: [
                          Text(
                            "Valor total: ",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "R\$${_calcularPreco()}",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.055),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          DateTime dataInicioBD = DateTime(
                    
                              dataInicio.year,
                              dataInicio.month,
                              dataInicio.day,
                              horaServInicio.hour,
                              horaServInicio.minute);
          print(dataInicioBD);
                          DateTime dataFimBD = DateTime(
                              dataFim.year,
                              dataFim.month,
                              dataFim.day,
                              horaServFim.hour,
                              horaServFim.minute);
          
                          int a = dataInicioBD.compareTo(dataFimBD);
                          var formatter = new DateFormat("dd/MM/yyyy hh:mm:ss a");
                          String inicioFormat = formatter.format(dataInicioBD);
                          String fimFormat = formatter.format(dataFimBD);
          
                          if (_portSelect != portes[0]) {
                            if (dataInicioBD.isAfter(dataFimBD) || a == 0) {
                              //msg de erro
                              var snackBar = const SnackBar(
                                  content: Text(
                                "O início do serviço deve ser antes de seu término.",
                                style: TextStyle(fontSize: 15),
                              ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              print(horaServFim);
                              print(horaServInicio);
                              print(idPet);
                              
                              
          
                               Future<ServiceResult> cadastro =
                                        tutorRopository.cadastrarServHosp(
                                            inicioFormat,
                                            fimFormat,
                                            valTotal,
                                            0,
                                            idCuid,
                                            idPet
                                            );
                                var snackBar = const SnackBar(
                                  content: Text(
                                "Serviço solicitado!",
                                style: TextStyle(fontSize: 15),
                              ));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              
                              Navigator.pop(context);
          
                            }
                          } else {
                            var snackBar = const SnackBar(
                                content: Text(
                              "Selecione um pet.",
                              style: TextStyle(fontSize: 15),
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(60, 115, 56, 1),
                        ),
                        child: Text(
                          'Solicitar Serviço',
                          style: TextStyle(
                              fontFamily: 'LilitaOne',
                              fontSize: MediaQuery.of(context).size.width * 0.05,
                              color: Color.fromARGB(255, 11, 42, 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

//-------------------------------------------- FIM DA PÁGINA

  Future<void> _selectDateInicio(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(7, 125, 27, 1), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 3, 65, 9), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 3, 65, 9),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    //primary: Colors.red, // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: dataInicio,
        firstDate: DateTime.now(),
        lastDate: DateTime.utc(DateTime.now().year + 2));
    if (pickedDate != null && pickedDate != dataInicio) {
      setState(() {
        var format = DateFormat("dd/MM/yyyy");
        dattaInicio = format.format(pickedDate);
        dataFim = pickedDate;
        dataInicio = pickedDate;
      });
    }
  }

  Future<void> _selectDateFinal(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(7, 125, 27, 1), // <-- SEE HERE
                onPrimary: Color.fromARGB(255, 3, 65, 9), // <-- SEE HERE
                onSurface: Color.fromARGB(255, 3, 65, 9),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    //primary: Colors.red, // button text color
                    ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: dataFim,
        firstDate: DateTime(
          dataInicio.year,dataInicio.month,dataInicio.day,DateTime.now().hour,DateTime.now().minute),
        lastDate: DateTime.utc(DateTime.now().year + 2));
    if (pickedDate != null && pickedDate != dataFim) {
      setState(() {
        var format = DateFormat("dd/MM/yyyy");
        dattaFim = format.format(pickedDate);
        dataFim = pickedDate;
      });
    }
  }

  Future<void> _selectTimeInicio(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: horaServInicio,
        initialEntryMode: TimePickerEntryMode.dial);
    
    if (TimeOfDay != null) {
      setState(() {
        if (newTime != null) {
          horaServFim = newTime;
          horaServInicio = newTime;
        }
      });
    }
  }

  Future<void> _selectTimeFinal(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: horaServFim,
        initialEntryMode: TimePickerEntryMode.dial);
    if (TimeOfDay != null) {
      setState(() {
        if (newTime != null) {
          horaServFim = newTime;
        }
      });
    }
  }

  String mostrarHoraIni(TimeOfDay a) {
    String? hora;
    String? min;

    if (a.hour < 10) {
      hora = "0${a.hour}";
    } else {
      hora = "${a.hour}";
    }
    if (a.minute < 10) {
      min = "0${a.minute}";
    } else {
      min = "${a.minute}";
    }

    return "$hora:$min";
  }

  double _calcularPreco(){
    DateTime inicio = DateTime(
      dataInicio.year, dataInicio.month, dataInicio.day,horaServInicio.hour,horaServInicio.minute);

    DateTime fim = DateTime(
      dataFim.year, dataFim.month, dataFim.day,horaServFim.hour,horaServFim.minute);

    var preco = valor;
    int min = fim.difference(inicio).inHours;
    
    var total = preco * min ;
    if(total < 0){
      total = - total;
      
    }
    setState(() {
      valTotal = total/10;
      print("t:$valTotal");
    });
    return total;
    
  }
}
