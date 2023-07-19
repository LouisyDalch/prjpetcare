import 'package:flutter/material.dart';

class WidInicio extends StatefulWidget {
  const WidInicio({super.key});

  @override
  State<StatefulWidget> createState() {
    return WidInicioState();
  }
}

class WidInicioState extends State<WidInicio> {
  Widget _botaoEntrar() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/escolherperfil');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: const Text(
            'Entrar',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ));
  }

  Widget _botaoCad() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/escolherperfilcad');
          },
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.025),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: const Text(
            'Cadastrar-se',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 204, 1),
        ),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'defora/imagens/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset(
                'defora/imagens/logopetcare.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'Aqui cuidamos do seu melhor amigo!',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'LilitaOne',
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(padding: EdgeInsets.all(20.0)),
          _botaoEntrar(),
          const Padding(padding: EdgeInsets.all(8)),
          _botaoCad()
        ]),
        Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('defora/imagens/logoartemis.png'))
      ],
    );
  }
}
