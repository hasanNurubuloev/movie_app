class ProductionCompaniesModel {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompaniesModel({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry
  });

  factory ProductionCompaniesModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompaniesModel(
    id: json['id'],
    logoPath : json['logo_path'],
    name : json['name'],
    originCountry : json['origin_country']
    );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['logo_path'] = logoPath;
    data['name'] = name;
    data['origin_country'] = originCountry;
    return data;
  }
}