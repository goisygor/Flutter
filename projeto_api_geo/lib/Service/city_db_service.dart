import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:projeto_api_geo/model/city_model.dart';
import 'package:sqflite/sqflite.dart';

class CityDataBaseService {
  static const String DB_NOME = 'cities.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'cities'; // Nome da tabela
  static const String
      CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      """CREATE TABLE cities (
        id SERIAL,
        cityname TEXT, 
        favoritecities BOOLEAN DEFAULT false)""";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  Future<List<City>> getAllCities() async {
    Database db = await _getDatabase();
    List<Map<String, dynamic>> maps = await db.query(TABLE_NOME);
    return List.generate(
   maps.length,
   (i){
    return City.fromMap(maps[i]);
   }
    );
  }

  Future<int> insertCity(City city) async {
    Database db = await _getDatabase();
    return await db.insert(TABLE_NOME, city.toMap());
  }

  Future<int> deleteCity(int id) async {
    try {
      Database db = await _getDatabase();
      return await db.delete(
        TABLE_NOME, 
        where: 'id =?',
         whereArgs: [id]);
    } catch (ex) {
      print(ex);
      return 0;
    }
  }

  Future<int> updateCity(Map<String, dynamic> city) async {
    try {
      Database db = await _getDatabase();
      return await db
          .update(
            TABLE_NOME, 
            city, where: 'id =?',
             whereArgs: [city['id']]);
    } catch (ex) {
      print(ex);
      return 0;
    }
  }
}
