import 'package:ejemplo_api/Api/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedCity = "Oaxaca";
  dynamic weatherData;

  final apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchData(selectedCity);
  }

  Future<void> fetchData(String city) async {
    final data = await apiService.fetchData(city);
    print(data);
    setState(() {
      weatherData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Api'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                style: const TextStyle(
                  fontSize: 130.0,
                  fontWeight: FontWeight.bold,
                ),
                ('${weatherData != null ? (weatherData['main']['temp']).toStringAsFixed(2) + ' °C' : 'nada '}')),
            Text(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                ('${weatherData != null ? weatherData['weather'][0]['description'] : 'nada '}')),
          ],
        )),
      ),
    );
  }
}

//'${weatherData['weather'][0]['description']}'