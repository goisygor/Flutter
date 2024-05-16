import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:projeto_api_geo/Service/weather_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> _weatherData = {};
  WeatherService _weatherService = new WeatherService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _getWeatherInit() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy:  LocationAccuracy.high
      );
    final  weatherData = await _weatherService.getWeatherByLocation(
          position.latitude, position.longitude);
      setState(() {
        _weatherData = _weatherData;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Previsão do Tempo"),
        // colocar icone de lupa para pesquisa
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("Pesquisar")),
                ElevatedButton(onPressed: () {}, child: const Text("Favoritos"))
              ],
            ),
            const SizedBox(height: 20),
            _weatherData.isEmpty
                ? Row(
                    children: [
                      Text("Erro de Conexão"),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {},
                      )
                    ],
                  )
                : Column(
                    children: [
                      Text(_weatherData["name"]),
                      const SizedBox(height: 10),
                      Text(_weatherData["weather"][0]["description"]),
                      const SizedBox(height: 10),
                      Text(_weatherData["main"]["temp"].toString()),
                      const SizedBox(height: 10),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
