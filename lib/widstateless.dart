import 'package:flutter/material.dart';
import 'package:prjpetcare/telas/cuidador/alterarsenha_c.dart';
import 'package:prjpetcare/telas/cuidador/criarconta_c.dart';
import 'package:prjpetcare/telas/cuidador/editar_agenda_c.dart';
import 'package:prjpetcare/telas/cuidador/editarperfil_c.dart';
import 'package:prjpetcare/telas/cuidador/esqsenha_cod_c.dart';
import 'package:prjpetcare/telas/cuidador/logado_c.dart';
import 'package:prjpetcare/telas/cuidador/login_c.dart';
import 'package:prjpetcare/telas/cuidador/perfil_c.dart';
import 'package:prjpetcare/telas/cuidador/serv_confirm_c.dart';
import 'package:prjpetcare/telas/cuidador/serv_finalizado_c.dart';
import 'package:prjpetcare/telas/cuidador/serv_solic_c.dart';
import 'package:prjpetcare/telas/selecionarperfil_cad.dart';
import 'package:prjpetcare/telas/tutor/esqsenha_cod_t.dart';
import 'package:prjpetcare/telas/tutor/esqsenha_email_t.dart';
import 'package:prjpetcare/telas/tutor/alterarsenha_t.dart';
import 'package:prjpetcare/telas/cuidador/esqsenha_email_c.dart';
import 'package:prjpetcare/telas/inicio.dart';
import 'package:prjpetcare/telas/selecionarperfil_log.dart';
import 'package:prjpetcare/telas/tutor/logado_t.dart';
import 'package:prjpetcare/telas/tutor/login_t.dart';

class WidStateless extends StatelessWidget{
  const WidStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const WidInicio(),
      initialRoute: '/inicio',
      routes: {
      '/inicio': (context) => const WidInicio(),

      //telas de login ------------------------------------------------

      '/entrarcuidador': (context) => const WidEntrarCuidador(),
      '/entrartutor':(context) => const WidEntrarTutor(),

      //crie sua conta cuidador! --------------------------------------
      '/criarcontacuidador':(context) => const CriarConta(),

      //telas de seleção de perfil ------------------------------------

      '/escolherperfil': (context) => const EscolherPerfil(),
      '/escolherperfilcad': (context) => const EscolherPerfilCad(),

      //telas pós login -----------------------------------------------

      '/logadotutor':(context) => const LogadoTutor(),
      '/logadocuidador':(context) => const LogadoCuidador(),

      //esqueceu senha ------------------------------------------------

      '/esqsenha_email_t':(context) => const EsqueciSenhaEmail(),
      '/esqsenha_email_c':(context) => const EsqueciSenhaEmail2(),
      '/alterarsenha_t':(context) => const EsqueceuSenha_Alterar(),
      '/alterarsenha_c':(context) => const EsqueceuSenhaY_Alterar(),
      '/codseguranca_c':(context) => const EsqSenhaCodRecC(),
      '/codseguranca_t':(context) => const EsqSenhaCodRecT(),

      //serviços -------------------------------------------------------

      '/serv_solic_c':(context) => const ServSolic_C(),
      '/serv_final_c':(context) => const ServFinal_C(),
      '/serv_confirm_c':(context) => const ServConfirm_C(),

      //Perfil ---------------------------------------------------------
      '/perfil_c':(context) => const Perfil_C(),
      '/editar_perfil_c':(context) => const EditarPerfilC(),
      '/editar_agenda_c':(context) => const EditarAgenda_C(),


    }
    );
    
  }
}