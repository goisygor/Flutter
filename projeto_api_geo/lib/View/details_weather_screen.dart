import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/weather_controller.dart';
import 'package:projeto_api_geo/Controller/city_db_controller.dart';
import '../Model/city_model.dart';

class DetailsWeatherScreen extends StatefulWidget {
  final String city;

  const DetailsWeatherScreen({Key? key, required this.city}) : super(key: key);

  @override
  State<DetailsWeatherScreen> createState() => _DetailsWeatherScreenState();
}

class _DetailsWeatherScreenState extends State<DetailsWeatherScreen> {
  final WeatherController _controller = WeatherController();
  final CityDbController _cityDbController = CityDbController();
  City? _currentCity;

  @override
  void initState() {
    super.initState();
    _getWeather();
    _loadCity();
  }

  Future<void> _getWeather() async {
    await _controller.getWeather(widget.city);
    setState(() {});
  }

  Future<void> _loadCity() async {
    await _cityDbController.listCities();
    _currentCity = _cityDbController.cities.firstWhere(
      (city) => city.cityName == widget.city,
      orElse: () => City(cityName: widget.city, isFavorite: false),
    );
    setState(() {});
  }

  Future<void> _toggleFavorite() async {
    if (_currentCity != null) {
      await _cityDbController.toggleFavoriteStatus(_currentCity!);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: _controller.weatherList.isEmpty
              ? const CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _controller.weatherList.last.name,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _currentCity?.isFavorite == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          onPressed: _toggleFavorite,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _controller.weatherList.last.main,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _controller.weatherList.last.description,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.thermostat),
                        const SizedBox(width: 5),
                        Text(
                          "${(_controller.weatherList.last.temp - 273).toStringAsFixed(2)} °C",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud),
                        const SizedBox(width: 5),
                        Text(
                          "${_controller.weatherList.last.clouds}%",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.water),
                        const SizedBox(width: 5),
                        Text(
                          "${_controller.weatherList.last.humidity}%",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.waves),
                        const SizedBox(width: 5),
                        Text(
                          "${_controller.weatherList.last.windSpeed} m/s",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
