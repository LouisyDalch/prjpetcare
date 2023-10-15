import 'package:flutter/material.dart';

/*class BottonNav {
  static int nav = 0;
  static BottomNavigationBar(){
    currentIndex: nav;
      backgroundColor: Color.fromRGBO(226, 225, 225, 1);
      fixedColor: Color.fromRGBO(219, 114, 38, 1);
      unselectedItemColor: Color.fromRGBO(117, 116, 116, 1);
      onTap: (opcao) {
        print("obs: $opcao");
        
        setState (() => nav = opcao);};
      items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Perfil"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label:"Loja"
          ),
      ];
  }
}*/

class DesignEntradaTxt {
  static InputDecoration decorarcaixa({
    required String hintText,
    required String labelText,
    required OutlineInputBorder border,
  }) {
    return InputDecoration(
        hintText: hintText, labelText: labelText, border: OutlineInputBorder(), counterText: "");
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/home.png',)),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/carrinho.png')),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/chats.png')),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/perfiltutor.png')),
            )
          ],
        ));
  }
}

class MenuHorTutor extends StatelessWidget {
  const MenuHorTutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(60, 115, 56, 1),
            borderRadius: BorderRadius.circular(30)),

        //------------------ BARRA-NAVEGAÇÃO ------------------------------

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/home.png',)),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/carrinho.png')),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/chats.png')),
            ),
            Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.01)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: IconButton(
                  onPressed: () {
                    //programação
                  },
                  icon: Image.asset('defora/imagens/perfiltutor.png')),
            )
          ],
        ));
  }
}

