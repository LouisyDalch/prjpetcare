import 'package:flutter/material.dart';

import '../../../Repositorios/cuidador_repos.dart';

class ItemConfirmC extends StatefulWidget {
  final ServicoSolic servico;

  const ItemConfirmC({super.key,
  required this.servico,});

  @override
  State<ItemConfirmC> createState() => _ItemConfirmCState(servico: servico);
}

class _ItemConfirmCState extends State<ItemConfirmC> {
  ServicoSolic servico;


  _ItemConfirmCState({
      required this.servico,
    }) : super();

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
                    Text(servico.tipoServ,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                     Text(servico.donoNome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Text(servico.nomePet,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.004)),
                    const Text('Data de término:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),),
                    const Text('Data/hra fin',
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
