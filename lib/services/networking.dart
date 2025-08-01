import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.uri);

  final Uri uri;

  Future getdata() async {
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.statusCode);
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
