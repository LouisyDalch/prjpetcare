import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';

class ItemPet_C extends StatefulWidget {
  final petCuid pet;
  const ItemPet_C({super.key,
  required this.pet});

  @override
  State<ItemPet_C> createState() => _ItemPet_CState(pet: pet, cuidadorRepository: CuidadorRepository());
}

class _ItemPet_CState extends State<ItemPet_C> {
  petCuid pet;
  CuidadorRepository cuidadorRepository;
  Uint8List? _imageDataPet;

   @override
  void initState() {
    super.initState();
    _loadImagePet();
  }

  _ItemPet_CState({
    required this.pet,
    required this.cuidadorRepository,
  }):super();

  Future<void> _loadImagePet() async {
    Uint8List data = await cuidadorRepository.getImagePet(pet.idDono);
    print(data.length);
    if (mounted) {
      setState(() {
        _imageDataPet = data;
      });
    }
  }

   String _calcularIdade(DateTime dataNasceu) {
    DateTime verifica =
        DateTime(DateTime.now().year, dataNasceu.month, dataNasceu.day);
    DateTime hoje = DateTime.now();
    int idade;
    int mes;
    if (DateTime.now().isBefore(verifica)) {
      idade = hoje.year - dataNasceu.year - 1;
    } else {
      idade = hoje.year - dataNasceu.year;
    }
    String a;

    if (idade > 0) {
      a = "$idade anos";
    } else {
      //calcular meses
      int mes = hoje.month - dataNasceu.month;
      if (mes > 1) {
        a = "$mes meses";
      } else {
        if (hoje.day > dataNasceu.day) {
          a = "$mes mês";
        } else {
          final mds = hoje.difference(dataNasceu).inDays;
          a = "$mds dias";
        }
      }
    }

    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
    child: Container(
       height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width * 0.1,
        color: Color.fromARGB(255, 147, 147, 147),
        child: Row(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              shape:BoxShape.circle,
            color: Colors.brown,
            image: _imageDataPet != null
                                      ? DecorationImage(
                                          image: MemoryImage(_imageDataPet!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
            ),
            ),
            Column(children: [
              Container(height: MediaQuery.of(context).size.height * 0.035),
              Text(pet.nome,style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.055
              ),),
              Text(_calcularIdade(pet.dataNasce!))
            ],)
        ]),
    ),
    );
  }
}