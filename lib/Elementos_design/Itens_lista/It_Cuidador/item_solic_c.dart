import 'package:flutter/material.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'dart:async';


//ref
class ItemSolicC extends StatefulWidget {
  final ServicoSolic servico;

  const ItemSolicC({
    super.key,
    required this.servico,
  });

  @override
  State<ItemSolicC> createState() => _ItemSolicCState(servico: servico, cuidadorRepository: CuidadorRepository());
}

class _ItemSolicCState extends State<ItemSolicC> {
  ServicoSolic servico;
  Uint8List? _imageData;
  CuidadorRepository cuidadorRepository;
  
    _ItemSolicCState({
      required this.servico,
      required this.cuidadorRepository,
    }) : super();

  @override
  void initState() {
    super.initState();
    print(this.servico.idDono);
    _loadImage();
  }

  Future<void> _loadImage() async {
    Uint8List data = await cuidadorRepository.getImageDataTutor(this.servico.idDono);
    print("imagem carregou");
    setState(() {
      _imageData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.16,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  image: _imageData != null
                    ? DecorationImage(
                        image: MemoryImage(_imageData!),
                        fit: BoxFit.cover,
                    )
                      : null,
                ),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(servico.tipoServ,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    
                    Text(servico.donoNome,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),),

                    Text(servico.dataIni != null ?
                    DateFormat('dd/MM/yyyy').format(servico.dataIni!) 
                    : 'Data inválida',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}


