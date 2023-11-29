import 'package:flutter/material.dart';
import 'package:prjpetcare/Elementos_design/background.dart';
import 'package:prjpetcare/Elementos_design/design.dart';
import 'package:prjpetcare/Elementos_design/Itens_lista/It_Tutor/item_pet_t.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';

import '../../API/tutoresmet.dart';

class MeusPets_T extends StatefulWidget {
  const MeusPets_T({super.key});

  @override
  State<MeusPets_T> createState() => _MeusPets_TState();
}

class _MeusPets_TState extends State<MeusPets_T> {
  List<PetTutor> lstPets = [];

  TutorRopository tutorRopository = TutorRopository();

  Future<ListResult> getPetsDoTutor() async {
    return await tutorRopository.puxarPetsDoTutor();
  }

  @override
  void initState() {
    super.initState();
    loadPets();
  }

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        const WidBackground(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Meus Pets",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.07),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, '/adicionar_pet_t'),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(202, 202, 202, 1)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Text(
                          "Adicionar Pet",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    //color: Colors.green
                  ),
                  child: ListView.builder(
                      itemCount: lstPets.length,
                      itemBuilder: (context, index) {
                        PetTutor pets = lstPets[index];
                        return ItemPet_T(pet: pets,);
                      }),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const MenuHorTutor()
              ],
            ),
          ],
        )
      ]),
    );
  }
}
