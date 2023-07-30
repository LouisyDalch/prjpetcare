import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemSolicC extends StatefulWidget {
  const ItemSolicC({super.key});

  @override
  State<ItemSolicC> createState() => _ItemSolicCState();
}

class _ItemSolicCState extends State<ItemSolicC> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
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
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image:NetworkImage("https://img.freepik.com/vetores-premium/amigo-3d-pessoas-contato-perfil-simbolo-do-emblema-do-icone-do-usuario-pessoa-humano-simbolo-de-sinal-de-avatar_659151-934.jpg"))
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Tipo_Serv',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Nome_Tutor',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Data/hra ini',
                    style: TextStyle(
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
