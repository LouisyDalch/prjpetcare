import 'package:flutter/material.dart';
import 'package:prjpetcare/Repositorios/cuidador_repos.dart';
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
import 'package:prjpetcare/telas/cuidador/visual_pet_c.dart';
import 'package:prjpetcare/telas/cuidador/visual_servconf_c.dart';
import 'package:prjpetcare/telas/cuidador/visual_servfinal_c.dart';
import 'package:prjpetcare/telas/cuidador/visual_servsolic_c.dart';
import 'package:prjpetcare/telas/cuidador/visual_tutor_c.dart';
import 'package:prjpetcare/telas/selecionarperfil_cad.dart';
import 'package:prjpetcare/telas/tutor/adicionar_pet_t.dart';
import 'package:prjpetcare/telas/tutor/cadastro_t.dart';
import 'package:prjpetcare/telas/tutor/editar_perfil_pet_t.dart';
import 'package:prjpetcare/telas/tutor/editarperfil_t.dart';
import 'package:prjpetcare/telas/tutor/esqsenha_cod_t.dart';
import 'package:prjpetcare/telas/tutor/esqsenha_email_t.dart';
import 'package:prjpetcare/telas/tutor/alterarsenha_t.dart';
import 'package:prjpetcare/telas/cuidador/esqsenha_email_c.dart';
import 'package:prjpetcare/telas/inicio.dart';
import 'package:prjpetcare/telas/selecionarperfil_log.dart';
import 'package:prjpetcare/telas/tutor/logado_t.dart';
import 'package:prjpetcare/telas/tutor/login_t.dart';
import 'package:prjpetcare/telas/tutor/meuhistorico_t.dart';
import 'package:prjpetcare/telas/tutor/meuspets_t.dart';
import 'package:prjpetcare/telas/tutor/mostrar_servadestra_t.dart';
import 'package:prjpetcare/telas/tutor/mostrar_servcreche_t.dart';
import 'package:prjpetcare/telas/tutor/mostrar_servhosp_t.dart';
import 'package:prjpetcare/telas/tutor/mostrar_servpasseio_t.dart';
import 'package:prjpetcare/telas/tutor/mostrar_servsitter_t.dart';
import 'package:prjpetcare/telas/tutor/perfil_pet_t.dart';
import 'package:prjpetcare/telas/tutor/perfil_t.dart';
import 'package:prjpetcare/telas/tutor/serv_confirm_t.dart';
import 'package:prjpetcare/telas/tutor/serv_finalizado_t.dart';
import 'package:prjpetcare/telas/tutor/serv_solic_t.dart';
import 'package:prjpetcare/telas/tutor/solicservico_t.dart';
import 'package:prjpetcare/telas/tutor/visual_cuidador_t.dart';
import 'package:prjpetcare/telas/tutor/visual_servconf_t.dart';
import 'package:prjpetcare/telas/tutor/visual_servfinal_t.dart';
import 'package:prjpetcare/telas/tutor/visual_servsolic_t.dart';

class WidStateless extends StatelessWidget{
  const WidStateless(MaterialApp materialApp, {super.key,});
  final String descr ='Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';
  

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(primarySwatch: Colors.grey),
      home: const WidInicio(),
      initialRoute: 'inicio',
      routes: {
      '/inicio': (context) => const WidInicio(),

      //telas de login ------------------------------------------------

      '/entrarcuidador': (context) => const WidEntrarCuidador(),
      '/entrartutor':(context) => const WidEntrarTutor(),

      //crie sua conta! --------------------------------------
      '/criarcontacuidador':(context) => const CriarConta(),
      '/cadastro_t':(context) => const Cadastro_T(),

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

      '/serv_confirm_t':(context) => const ServConf_T(),
      '/serv_final_t':(context) => const ServFinal_T(),
      '/serv_solic_t':(context) => const ServSolic_T(),

      //Perfil ---------------------------------------------------------
      '/perfil_c':(context) => Perfil_C(),
      '/editar_perfil_c':(context) => const EditarPerfilC(),
      '/editar_agenda_c':(context) => const EditarAgenda_C(),
      
      '/perfil_t':(context) => const PerfilTutor(),
      '/editar_perfil_t':(context) => const EditarPerfil_T(),
      '/meuspet_t':(context) => const MeusPets_T(),
      '/meuhist_t':(context) => const MeuHist_T(), //terminar esse aq


      //Funções --------------------------------------------------------
      '/perfil_pet_t':(context) => const PerfilPet_T(),
      '/editar_perfil_pet_t':(context) => const EditarPerfPet_T(),
      '/adicionar_pet_t':(context) => const AdicionarPet_T(),



      //Visualizações -----------------------------------------------------
      '/visualizacao_pet_c':(context) => Container(child: VisualizacaoPet_T(text: descr)),
      '/visualizacao_tutor_c':(context) => const VisualTutor_C(),
      '/visualizacao_servsolic_c':(context) => const VisualServSolic(),
      '/visualizacao_servfinal_c':(context) => const VisualServFinal(),

      '/visualizacao_servconf_t':(context) => const VisualServConf_T(),
      '/visualizacao_servsolic_t':(context) => const VisualServSolic_T(),
      '/visualizacao_servfinal_t':(context) => const VisualServFinal_T(),
      '/visualizacao_cuidador_t':(context) => const VisualCuidador_T(),

      //Serviços selecionados by tutor -------------------------------------
      '/mostrar_hosp_t':(context) => const MostrarServHosp_T(),
      '/mostrar_pass_t':(context) => const MostrarServPass_T(),
      '/mostrar_creche_t':(context) => const MostrarServCreche_T(),
      '/mostrar_sitter_t':(context) => const MostrarServPetSitter_T(),
      '/mostrar_adestra_t':(context) => const MostrarServAdestra_T(),

      '/solic_servico_t':(context) => const SolicServico(),
    }
    );
    
  }
}