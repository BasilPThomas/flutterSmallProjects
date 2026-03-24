import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'bd6f7abd20143535d5cb69f3848ee0f7';

class NetworkHelper{

  NetworkHelper(this.url);
  final String url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url),);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

}