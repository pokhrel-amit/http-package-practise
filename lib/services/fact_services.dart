import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http_implementation/model/fact_response.dart';

Future albumResponse() async {
  final String url = 'https://thegrowingdeveloper.org/apiview?id=2';
  final response = await http.get(
    Uri.parse(url),
  );
  FactResponse factResponse = FactResponse.fromJson(jsonDecode(response.body));
  return factResponse;
}

void main(List<String> args) {
  albumResponse();
}
