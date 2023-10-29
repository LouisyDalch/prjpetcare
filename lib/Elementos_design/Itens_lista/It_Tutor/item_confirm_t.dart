import 'package:flutter/material.dart';

class ItemConfirmT extends StatefulWidget {
  const ItemConfirmT({super.key});

  @override
  State<ItemConfirmT> createState() => _ItemConfirmTState();
}

class _ItemConfirmTState extends State<ItemConfirmT> {
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text('Tipo_Serv',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text('Nome_Cuidador',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text('Data/hra fin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
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
