import 'dart:convert';
import 'package:fieldnxtdemo/utilities/sharedpreferences.dart';
import 'package:http/http.dart' as http;

class WebClient {
  static const ip = "http://20.127.73.89";

  static Future<dynamic> post(url, data) async {
    var token = await PrefManager.getToken();

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    var request = http.Request('POST', Uri.parse(ip + url));
    request.bodyFields = data;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 401) {
      return jsonDecode(await response.stream.bytesToString());
    } else {
      var error = {
        "message": "Something went wrong",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var token = await PrefManager.getToken();
    var response = await http.get(Uri.parse(ip + url),
        headers: {"Content-Type": "application/json", "token": token ?? ""});

    if (response.statusCode == 200 || response.statusCode == 401) {
      return jsonDecode(response.body);
    } else {
      var error = {
        "message": "Something went wrong",
      };
      return error;
    }
  }
}
