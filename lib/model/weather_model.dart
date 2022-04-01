class Weather {
  String? cityName;
  num? temp;
  String? feelLike;
  num? maxTemp;
  num? minTemp;

  Weather({
    this.cityName,
    this.temp,
    this.feelLike,
    this.maxTemp,
    this.minTemp,
  });
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    feelLike =
        json["weather"].isNotEmpty ? json["weather"][0]["description"] : null;
    maxTemp = json["main"]["temp_max"];
    minTemp = json["main"]["temp_min"];
  }
}
