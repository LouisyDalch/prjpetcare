import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:prjpetcare/Repositorios/tutor_repos.dart';
import 'package:prjpetcare/telas/tutor/perfil_pet_t.dart';

import '../../../API/tutoresmet.dart';
//p programar
class ItemPet_T extends StatefulWidget {
  final PetTutor pet;
  const ItemPet_T({super.key,
  required this.pet});

  @override
  State<ItemPet_T> createState() => _ItemPet_TState(pet: pet, tutorRopository: TutorRopository());
}

class _ItemPet_TState extends State<ItemPet_T> {
  PetTutor pet;
  Uint8List? _imageData;
  TutorRopository tutorRopository;

  _ItemPet_TState({
    required this.pet,
    required this.tutorRopository
  }):super();

  void initState() {
    super.initState();
    _loadImage();
    
  }

  Future<void> _loadImage() async {
        print(this.pet.idPet);
    Uint8List data = await tutorRopository.getImagePet(this.pet.idPet);
    print(data.length);
    if(mounted){
      setState(() {
      _imageData = data;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (
              (context) => PerfilPet_T(idPet: pet.idPet,)))),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.1,
          
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).size.width * 0.04,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(width: MediaQuery.of(context).size.width * 0.04,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 7, 95, 27),
                      image: _imageData != null
                        ? DecorationImage(
                            image: MemoryImage(_imageData!),
                            fit: BoxFit.cover,
                        )
                          : null,
                    ),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.04,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Text(pet.nome, style: 
                    TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),),
                  ),
                  Container(width: MediaQuery.of(context).size.width * 0.04,),
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Icon(Icons.delete,
                    color: Color.fromARGB(255, 151, 42, 34),),
                  )
                ],
              ),
              Container(height: MediaQuery.of(context).size.width * 0.03,),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.002,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Title'),
          content: Text("Você quer realmente deletar ${pet.nome}?"),
          actions: [
            TextButton(
              onPressed: () async {
                Future<ServiceResult> delete =
                                        tutorRopository.deletarPet(
                                           pet.idPet
                                            );
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/meuspet_t');

                var snackBar = const SnackBar(
                    content: Text(
                  "Pet deletado.",
                  style: TextStyle(fontSize: 15),
                ));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

               
              },
              child: Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Não'),
            ),
          ],
        );
      },
    );
  }
}
