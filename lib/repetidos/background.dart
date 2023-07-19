import 'package:flutter/material.dart';

class WidBackground extends StatelessWidget {
  const WidBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
            //
            width: double.infinity,
            height: double.infinity,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child:
                Image.asset('defora/imagens/background.png', fit: BoxFit.cover),
          )
          ],
        ),
      ),
    );
  }
}