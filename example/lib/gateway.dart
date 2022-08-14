import 'dart:convert';
import 'package:http/http.dart' as http;

class Gateway {
  final String baseUrl = 'picsum.photos';
  final String endPoint = '/v2/list';

  Future<List<dynamic>> getImages() async {
    final uri = Uri.https(baseUrl, endPoint, {'term': 'nature'});
    final response = await http.get(uri);
    return json.decode(response.body) as List<dynamic>;
  }
}
