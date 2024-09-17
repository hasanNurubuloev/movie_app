class ProductionCountriesModel{
  final String iso_3166_1;
  final String name;

  ProductionCountriesModel({required this.iso_3166_1, required this.name});

  factory ProductionCountriesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountriesModel(
        iso_3166_1: json['iso_3166_1'],
        name : json['name'],
    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso_3166_1;
    data['name'] = name;
    return data;
  }
}