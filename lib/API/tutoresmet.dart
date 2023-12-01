import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:sql_conn/sql_conn.dart';
//p programar
class TutorAPI{

  Future<LoginResult> loginTutor(String usuario,String senha) async {
    final response = await http.get(Uri.parse(
      "http://10.244.171.33/LoginTutorFW.aspx?username=$usuario&password=$senha"));


    if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return LoginResult.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
  }

   Future<Uint8List> getImageDataCuid(String? token, int idCuidador) async {
    if (token == null) throw Exception('Failed to login');

    final response = await http.get(
      Uri.parse("http://10.244.171.33/ImgHandler.aspx?idCuidador=$idCuidador"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    return response.bodyBytes;
  }

  Future<ServiceResult> cadastroTutor(
    String nome,String email,String datanasce, String cell, String cpf,
    String genero, String senha, String cidade, String bairro, String uf,
    String cep, String complemento, int numero) async {
    final response = await http.get(Uri.parse(
      "http://10.244.171.33/CadastrarTutor.aspx?nome=$nome&email=$email&datanasce=$datanasce&cell=$cell&cpf=$cpf&genero=$genero&senha=$senha&cidade=$cidade&bairro=$bairro&uf=$uf&cep=$cep&complemento=$complemento&numero=$numero"));


    if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return ServiceResult(success: true);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to login');
  }
  }

  Future<ListResult> puxarCuidHosp(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarCuidHosp.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarEndCuidTutor(String? token, String idCuid)  async{
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarEndCuidTutor.aspx?idCuid=$idCuid"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarSomaAval(String? token, String idCuid)  async{
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarAvalNumCuid.aspx?idCuid=$idCuid"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarTipoServTutor(String? token, String idTipoServ) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarTipoServTutor.aspx?idTipoServ=$idTipoServ"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarDias(String? token, String idAgenda) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarDias.aspx?idAgenda=$idAgenda"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarTipoPet(String? token, String idTipoPet) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarTipoPet.aspx?idTipoPet=$idTipoPet"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarFeedbackTutor(String? token, String idCuid) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarFeedbackTutor.aspx?idCuid=$idCuid"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarDadosTutores(String? token, String idTutor) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarInfoTutores.aspx?idTutor=$idTutor"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarPetsDoTutor(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarPetsDoTutor.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<Uint8List> getImagePet(String? token, int idPet) async {
    if (token == null) throw Exception('Failed to login');

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarImgPet.aspx?idPet=$idPet"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    print(response.statusCode);

    return response.bodyBytes;
  }

  Future<ServiceResult> cadastrarImgPet(String? token, Uint8List image, String nome) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    var file =
        http.MultipartFile.fromBytes("image", image, filename: "imagem.png");

    var request = http.MultipartRequest("POST",
        Uri.parse("http://10.244.171.33/Tutor/Servicos/CadastrarImgPet.aspx?nome=$nome"));

    request.files.add(file);
    request.headers.addAll({"Authorization": token});

    http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);

    print(response.body);

    return ServiceResult(success: response.statusCode == 200);
  }

  Future<ListResult> puxarPet(String? token, String idPet) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarInfoPet.aspx?idPet=$idPet"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarMeusDadosTutor(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarMeusDadosTutor.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<ListResult> puxarMeuEndTutor(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarEndTutor.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return ListResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('deu merda, chama o gabs');
    }
  }

  Future<Uint8List> pegarMinhaFoto(String? token) async { //é do cuidador
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Tutor/Servicos/PuxarMinhaImg.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    print(response.body);

    return response.bodyBytes;
  }

  Future<ServiceResult> salvarFotoTutor(String? token, Uint8List image) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    var file =
        http.MultipartFile.fromBytes("image", image, filename: "imagem.png");

    var request = http.MultipartRequest("POST",
        Uri.parse("http://10.244.171.33/Tutor/Servicos/CadastrarImgTutor.aspx"));

    request.files.add(file);
    request.headers.addAll({"Authorization": token});

    http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);

    print(response.body);

    return ServiceResult(success: response.statusCode == 200);
  }

  Future<ServiceResult> atualizarDadosTutor(String? token,
    String email, String cell, String cidade, String bairro, String uf,
    String cep, String complemento,String rua, int numero) async {
   if (token == null) throw Exception('Failed to login');

    print(token);

    var request = http.MultipartRequest("POST",
        Uri.parse( "http://10.244.171.33/Tutor/Servicos/EditarDadosTutor.aspx?email=$email&cell=$cell&cidade=$cidade&bairro=$bairro&uf=$uf&cep=$cep&complemento=$complemento&rua=$rua&numero=$numero"));

    
        request.headers.addAll({"Authorization": token});

         http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);
    print(response.body);
    return ServiceResult.fromJson(jsonDecode(response.body));
  }
  

}




class ServiceResult {
  final bool success;

  ServiceResult({
    required this.success,
  });

  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult(
      success: json['success']
    );
  }
}

class ListResult extends ServiceResult {
  final List<dynamic> resultados;

  ListResult({
    required bool success,
    required this.resultados,
  }) : super(success: success);
//minha msg de erro funciona kkkk
  factory ListResult.fromJson(Map<String, dynamic> json) {
    print("aqqqqqqq");
    print(json);
    return ListResult(
        success: json['success'],
        resultados: List<dynamic>.from(json['Resultados'].map((x) => x)));
  }
}

class LoginResult extends ServiceResult {
  final String? token;

  LoginResult({
    required bool success,
    this.token,
  }) : super(success: success);

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      success: json['success'],
      token: json['token']
    );
  }
}

