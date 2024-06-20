import 'package:flutter/material.dart';
import 'package:projeto_api_geo/Controller/city_db_controller.dart';
import '../Controller/weather_controller.dart';
import '../Model/city_model.dart';
import 'details_weather_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final WeatherController _controller = WeatherController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cityController = TextEditingController();
  final CityDbController _dbController = CityDbController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pesquisa Por Cidade")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Insira a Cidade"),
                      controller: _cityController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Insira a Cidade";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _findCity(_cityController.text);
                        }
                      },
                      child: const Text("Search"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<City>>(
                future: _dbController.listCities(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final city = snapshot.data![index];
                        return ListTile(
                          title: Text(city.cityName),
                          onTap: () {
                            _findCity(city.cityName);
                          },
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text("Empty List"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _findCity(String city) async {
    if (await _controller.findCity(city)) {
      City newCity = City(cityName: city, isFavorite: false);
      await _dbController.addCity(newCity);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Found City!"),
          duration: Duration(seconds: 1),
        ),
      );
      setState(() {});
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => DetailsWeatherScreen(city: city),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("City not Found!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
