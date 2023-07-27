import 'package:flutter/material.dart';

class DesignEntradaTxt {
  static InputDecoration decorarcaixa({
    required String hintText,
    required String labelText,
    required OutlineInputBorder border,
  }) {
    return InputDecoration(
        hintText: hintText, labelText: labelText, border: OutlineInputBorder());
  }
}

class MenuHorCuidador extends StatelessWidget {
  const MenuHorCuidador({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(219, 114, 38, 1),
            borderRadius: BorderRadius.circular(30)),

        //------------------ BARRA-NAVEGAÇÃO ------------------------------

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  //programação
                },
                icon: Image.asset('defora/imagens/home.png')),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            IconButton(
                onPressed: () {
                  //programação
                },
                icon: Image.asset('defora/imagens/carrinho.png')),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            IconButton(
                onPressed: () {
                  //programação
                },
                icon: Image.asset('defora/imagens/chats.png')),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            IconButton(
                onPressed: () {
                  //programação
                },
                icon: Image.asset('defora/imagens/perfiltutor.png'))
          ],
        ));
  }
}
