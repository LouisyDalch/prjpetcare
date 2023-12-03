import 'dart:convert';
import 'dart:typed_data';
//gfgf
import 'package:http/http.dart' as http;

class CuidadoresAPI {
  Future<LoginResult?> loginCuidadores(String usuario, String senha) async {
    final response = await http.get(Uri.parse(
        "http://10.244.171.33/LoginFW.aspx?username=$usuario&password=$senha"));
    //lembrete: em caso de erro, verifique o ip ;)

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return LoginResult.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      //  throw Exception('deu merda, chama o gabs');
      return null;
    }
  }

  Future<ListResult> chamarImagemCuidador(String? token) async {
    //tbm vai ser usado p conf
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/ImgHandler.aspx"),
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
      throw Exception('deu merda, chama o gabs'); //<3333333333333333
    }
  }

  Future<ListResult> puxarInfosCuid(String? token) async {
    //tbm vai ser usado p conf
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarInfosCuid.aspx"),
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
      throw Exception('deu merda, chama o gabs'); //<3333333333333333
    }
  }

  

  Future<ListResult> puxarAgenda(String? token) async {
    //tbm vai ser usado p conf
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarAgenda.aspx"),
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
      throw Exception('deu merda, chama o gabs'); //<3333333333333333
    }
  }

  Future<Uint8List> pegarFoto(String? token) async { //é do cuidador
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/GetImagem.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    print(response.body);

    return response.bodyBytes;
  }

  Future<ServiceResult> salvarFoto(String? token, Uint8List image) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    var file =
        http.MultipartFile.fromBytes("image", image, filename: "imagem.png");

    var request = http.MultipartRequest("POST",
        Uri.parse("http://10.244.171.33/Cuidadores/Servicos/SalvarFoto.aspx"));

    request.files.add(file);
    request.headers.addAll({"Authorization": token});

    http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);

    print(response.body);

    return ServiceResult(success: response.statusCode == 200);
  }

  Future<ListResult> puxarServicosSolic(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarSolic.aspx"),
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

  Future<ListResult> puxarServFinal(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarFinal.aspx"),
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

  Future<Uint8List> getImageDataTutor(String? token, int idTutor) async {
    if (token == null) throw Exception('Failed to login');

    final response = await http.get(
      Uri.parse("http://10.244.171.33/ImgHandler.aspx?idTutor=$idTutor"),
      headers: <String, String>{
        'Authorization': token,
      },
    );

    return response.bodyBytes;
  }

  Future<ListResult> puxarEndCuidador(String? token)  async{
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarEndCuid.aspx"),
      headers: <String, String>{
        'Authorization': token,
      },//
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

  Future<ListResult> puxarServConf(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarConf.aspx"),
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

  Future<ListResult> puxarPetCuid(String? token, String idPet) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarPetCuid.aspx?idPet=$idPet"),
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

  Future<ServiceResult> alterarAgenda(
    String? token, int dom, int seg, int ter, int qua, int qui, int sex, int sab
  ) async {
    if (token == null) throw Exception('Failed to login');

    final response = await http.get(Uri.parse(
      "http://10.244.171.33/AlterarAgendaCuid.aspx?dom=$dom&seg=$seg&ter=$ter&qua=$qua&qui=$qui&sex=$sex&sab=$sab"),
      headers: <String, String>{
        'Authorization': token,
      },);


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

  Future<ListResult> puxarDadosTutorCuid(String? token, String idTutor) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarDadosTutorCuid.aspx?idTutor=$idTutor"),
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

  Future<ListResult> puxarEndTutorCuid(String? token, String idTutor) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarEndTutorCuid.aspx?idTutor=$idTutor"),
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

  Future<ListResult> puxarTipoServ(String? token, String idTipoServ) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarTipoServ.aspx?idTipoServ=$idTipoServ"),
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

  Future<ServiceResult> atualizarDadosCuid(String? token,
    String email, String cell, String cidade, String bairro, String uf,
    String cep, String complemento,String rua, int numero, double valor) async {
   if (token == null) throw Exception('Failed to login');

    print(token);

    var request = http.MultipartRequest("POST",
        Uri.parse( "http://10.244.171.33/Cuidadores/Servicos/EditarCuidador.aspx?email=$email&cell=$cell&cidade=$cidade&bairro=$bairro&uf=$uf&cep=$cep&complemento=$complemento&rua=$rua&numero=$numero&valor=$valor"));

    
        request.headers.addAll({"Authorization": token});

         http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);
    print(response.body);
    return ServiceResult.fromJson(jsonDecode(response.body));
  }

  Future<ServiceResult> atualizarAgenda(String? token,
    int dom, int seg, int ter, int qua, int qui, int sex, int sab) async {
   if (token == null) throw Exception('Failed to login');

    print(token);

    var request = http.MultipartRequest("POST",
        Uri.parse( "http://10.244.171.33/Cuidadores/Servicos/AlterarAgenda.aspx?dom=$dom&seg=$seg&ter=$ter&qua=$qua&qui=$qui&sex=$sex&sab=$sab"));

    
        request.headers.addAll({"Authorization": token});

         http.StreamedResponse stream = await request.send();
    var response = await http.Response.fromStream(stream);
    print(response.body);
    return ServiceResult.fromJson(jsonDecode(response.body));
  }

  Future<ListResult> puxarDias(String? token) async {
    if (token == null) throw Exception('Failed to login');

    print(token);

    final response = await http.get(
      Uri.parse("http://10.244.171.33/Cuidadores/Servicos/PuxarDias.aspx"),
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

  
}

class ServiceResult {
  final bool success;

  ServiceResult({
    required this.success,
  });

  factory ServiceResult.fromJson(Map<String, dynamic> json) {
    return ServiceResult(success: json['success']);
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
    return LoginResult(success: json['success'], token: json['token']);
  }


  


}
