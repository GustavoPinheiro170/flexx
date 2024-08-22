import 'package:http/http.dart' as http;



class HttpRequests {
  static Future<http.Response> requestHttpPost(String url, String json) async {
    final http.Response response;
    response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json ; charset=UTF-8'
      },
      body: json,
    );
    return response;
  }
}
