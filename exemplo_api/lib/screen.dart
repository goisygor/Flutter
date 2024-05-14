import 'package:flutter/material.dart';

import 'service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService(
    apiKey: 'b9ebe666087f299f5e2aad3a03d093b6', // Chave de API para acesso à API de previsão do tempo.
    baseUrl: 'https://api.openweathermap.org/data/2.5', // URL base da API de previsão do tempo.
  );

  late Map<String, dynamic> _weatherdata;
  late TextEditingController _cityController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weatherdata = new Map<String, dynamic>();
    _cityController = TextEditingController();
  }

  Future<void> _fecthWeatherData(String city) async {
    try {
      final weatherData = await _weatherService.getWeather(city);
      setState(() {
        _weatherdata = weatherData;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo weather-API"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: "",
              ),
              onChanged: (value) {},
            ),
            SizedBox(
                height:
                    16.0), 
            ElevatedButton(
              onPressed: () {
                String cityNome = _cityController.text;

                _fecthWeatherData(cityNome);
              },
              child: Text('Buscar'),
            ),
          ],
        ),
      ),
    );
  }
}
