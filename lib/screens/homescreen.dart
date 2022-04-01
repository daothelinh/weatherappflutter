// import 'dart:io';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:weatherapp/services/weather_api_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<Weather?> getData() async {
    data = await client.getCurrentWeather("Ha Noi");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Align(
      //     // child: Text('Weather'),
      //     alignment: Alignment.center,
      //   ),
      // ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/skyimage.jpg"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(98.0),
          child: FutureBuilder<Weather?>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //   if (snapshot.hasData) {
                //     return _location(snapshot.data?.cityName ?? "Unknow");
                //   } else {
                //     return Text('Error');
                //   }
                // } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${data!.cityName}",
                      style: const TextStyle(fontSize: 42),
                    ),
                    Text(
                      "${data!.feelLike}",
                      style: const TextStyle(fontSize: 15),
                    ),
                    Text(
                      "${data!.temp}°",
                      style: const TextStyle(fontSize: 80),
                    ),
                    Text(
                      'C: ${data!.maxTemp}°   T: ${data!.minTemp}°',
                      style: const TextStyle(fontSize: 15),
                    ),

                    // _location(),
                    // _reaction(),
                    // _temprature(),
                    // _showall(),
                  ],
                );

                //  Center(
                //   child: Platform.isAndroid
                //       ? CircularProgressIndicator()
                //       : CupertinoActivityIndicator(),
                // );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

// _location() {
//   return Text(
//     "Hà Nội",
//     style: TextStyle(fontSize: 32),
//   );
// }

// _reaction() {
//   return Text(
//     "có mây",
//     style: TextStyle(fontSize: 15),
//   );
// }

// _temprature() {
//   return Text(
//     '26°',
//     style: TextStyle(fontSize: 90),
//   );
// }

// _showall() {
//   return Text(
//     'C:27°   T:21°',
//     style: TextStyle(fontSize: 15),
//   );
// }
