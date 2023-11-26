import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:prjpetcare/Elementos_design/background.dart';

class SolicServico extends StatefulWidget {
  final int idCuid;
  final String nome;
  final String tipoServ;

  const SolicServico({super.key,
  required this.idCuid,
  required this.nome,
  required this.tipoServ});

  @override
  State<SolicServico> createState() => _SolicServicoState(
    idCuid: idCuid, nome: nome, tipoServ: tipoServ);
}

class _SolicServicoState extends State<SolicServico> {
  _SolicServicoState({
    required this.idCuid,
    required this.nome,
    required this.tipoServ
  }) {
    _portSelect = portes[0];
  }
  TimeOfDay horaServInicio = TimeOfDay.now();
  TimeOfDay horaServFim = TimeOfDay.now();
  DateTime dataInicio = DateTime.now();
  String dattaInicio = "";
  DateTime dataFim = DateTime.now();
  String dattaFim = "";

  final portes = ["Selecionar pet", "Katy", "Toby"];
  String? _portSelect = "";

  //PROGRAMAÇÃO BD
  int idCuid;
  String nome;
  String tipoServ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WidBackground(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          items: portes.map((e) {
                            return DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              _portSelect = val.toString();
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
                          "R\$12,00",
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

                        DateTime dataFimBD = DateTime(
                            dataFim.year,
                            dataFim.month,
                            dataFim.day,
                            horaServFim.hour,
                            horaServFim.minute);

                        int a = dataInicioBD.compareTo(dataFimBD);

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

                            //PROGRAMAÇÃO

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
        firstDate: DateTime(1950),
        lastDate: DateTime.utc(DateTime.now().year + 2));
    if (pickedDate != null && pickedDate != dataInicio) {
      setState(() {
        var format = DateFormat("dd/MM/yyyy");
        dattaInicio = format.format(pickedDate);
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
        firstDate: DateTime(1950),
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
}
