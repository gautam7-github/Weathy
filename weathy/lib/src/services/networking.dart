import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  final String url;
  NetworkService({required this.url});

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      String data = response.body;
      var weatherData = jsonDecode(data);
      return weatherData;
    } catch (e) {
      print(e);
    }
  }
}
