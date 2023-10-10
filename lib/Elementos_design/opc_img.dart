import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prjpetcare/telas/tutor/adicionar_pet_t.dart';

class OpcImgPet extends StatefulWidget {
  const OpcImgPet({super.key});

  @override
  State<OpcImgPet> createState() => _OpcImgPetState();
}

class _OpcImgPetState extends State<OpcImgPet> {
  final imagemPicker = ImagePicker();
  File? imgFile;

  pick(
    ImageSource source
  ) async {
    final pickedFile = await imagemPicker.pickImage(source: source);

    if(pickedFile != null){

      if(this.mounted){
        setState(() {
        imgFile = File(pickedFile!.path);
      });
      }
      
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.photo_library,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  title: Text(
                    'Galeria',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Buscar imagem da galeria
                    pick(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.photo_camera_back_rounded,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  title: Text(
                    'Câmera',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Buscar imagem da galeria
                    pick(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Center(
                      child: Icon(
                        Icons.no_photography_outlined,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  title: Text(
                    'Remover Foto',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    imgFile = null;
                  },
                ),
          ],
        ),
      );
  }
}