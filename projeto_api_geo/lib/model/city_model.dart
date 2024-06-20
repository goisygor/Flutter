class City {
  final String cityName;
  bool isFavorite;
  final int? id;

  City({required this.cityName, this.isFavorite = false, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cityname': cityName,
      'isfavorite': isFavorite ? 1 : 0,
    };
  }

  factory City.fromMap(Map<String, dynamic> map) {
    return City(
      id: map['id'],
      cityName: map['cityname'],
      isFavorite: map['isfavorite'] == 1,
    );
  }
}
