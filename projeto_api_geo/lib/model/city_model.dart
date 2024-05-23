class City {
  // atributos
  final String cityName;
  final bool favoriteCities;

  City({required this.cityName, required this.favoriteCities});
  // métodos
  // toMap
  Map<String, dynamic> toMap() {
    return {'cityname': cityName, 'favoritecities': favoriteCities};
  }

  //fromMap
  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      cityName: map['cityname'],
      favoriteCities: map['favoritecities'],
    );

    
  }

}
