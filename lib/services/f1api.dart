import 'package:http/http.dart' as http;
import 'dart:convert';

class Ergast {
  String domain = 'https://ergast.com/api/f1/current';
  String driveruri = '/driverStandings.json';
  String constructoruri = '/constructorStandings.json';

  Future<Map<String, dynamic>> getDrivers() async {
    var response = await http.get(Uri.parse(domain + driveruri));
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> getConstructors() async {
    var response = await http.get(Uri.parse(domain + constructoruri));
    return jsonDecode(response.body);
  }
}
