import 'package:projeto_api_geo/Model/city_model.dart';
import 'package:projeto_api_geo/Service/city_db_service.dart';

class CityDbController {
  List<City> _cities = [];
  final CityDataBaseService _dbService = CityDataBaseService();

  List<City> get cities => _cities;

  Future<List<City>> listCities() async {
    List<Map<String, dynamic>> maps = await _dbService.getAllCities();
    _cities = maps.map<City>((e) => City.fromMap(e)).toList();
    return _cities;
  }

  Future<void> addCity(City city) async {
    await _dbService.insertCity(city);
    await listCities();
  }

  Future<void> toggleFavoriteStatus(City city) async {
    city.isFavorite = !city.isFavorite;
    await _dbService.updateCity(city);
    await listCities();
  }

  void addCities(City cidade) {}
}
