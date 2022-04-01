import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather?> getCurrentWeather(String? location) async {
    try {
      var endpoint = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=22e603cc8befdf8c701e16bd2c104f20&units=metric");

      var resposne = await http.get(endpoint);
      var body = jsonDecode(resposne.body);
      print(Weather.fromJson(body));
      return Weather.fromJson(body);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
