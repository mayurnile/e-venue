import "dart:convert";

import "package:http/http.dart" as http;
import "package:http/http.dart";

abstract class HttpServices {
  Future<Response> getCall({required String url, String? queryParams});

  Future<Response> postCall({required Map<String, dynamic> variables, required String url});

  Future<Response> patchCall({required Map<String, dynamic> variables, required String url});

  Future<Response> putCall({required Map<String, dynamic> variables, required String url});

  Future<Response> deleteCall({required String url, Map<String, dynamic>? variables});
}

class HttpServicesImpl extends HttpServices {
  final Client client = http.Client();

  @override
  Future<http.Response> getCall({required String url, String? queryParams}) async {
    const String token = "";

    if (queryParams != null) {
      url += queryParams;
    }

    final http.Response response = await client.get(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json",
        if (token != "") "Authorization": token,
      },
    );
    return response;
  }

  @override
  Future<http.Response> postCall({required Map<String, dynamic>? variables, required String url}) async {
    const String token = "";

    final http.Response response = await client.post(
      Uri.parse(url),
      headers: <String, String>{
        "Content-Type": "application/json",
        if (token != "") "Authorization": token,
      },
      body: json.encode(variables),
    );
    return response;
  }

  @override
  Future<http.Response> patchCall({required Map<String, dynamic> variables, required String url}) async {
    const String token = "";

    final http.Response response = await client.patch(Uri.parse(url), body: variables, headers: <String, String>{
      "Content-Type": "application/json",
      if (token != "") "Authorization": token,
    });
    return response;
  }

  @override
  Future<http.Response> putCall({required Map<String, dynamic> variables, required String url}) async {
    const String token = "";

    final http.Response response = await client.put(Uri.parse(url), body: variables, headers: <String, String>{
      "Content-Type": "application/json",
      if (token != "") "Authorization": token,
    });
    return response;
  }

  @override
  Future<http.Response> deleteCall({required String url, Map<String, dynamic>? variables}) async {
    const String token = "";

    final http.Response response = await client.delete(Uri.parse(url), body: variables, headers: <String, String>{
      "Content-Type": "application/json",
      if (token != "") "Authorization": token,
    });
    return response;
  }
}
