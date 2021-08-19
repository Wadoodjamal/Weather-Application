import 'dart:convert';
import 'package:http/http.dart' as http;

class NetowrkingHelper {
  NetowrkingHelper(this.url);
  final String? url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url!));

    if (response.statusCode == 200) {
      String weatherData = response.body;
      var decodedData = jsonDecode(weatherData);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
