class SpokenLanguageModel {
  final String englishName;
  final String iso_639_1;
  final String name;

  SpokenLanguageModel({required this.englishName, required this.iso_639_1, required this.name});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json){
    return SpokenLanguageModel(
        englishName: json['english_name'],
        iso_639_1: json['iso_639_1'],
        name: json['name']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName;
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    return data;
  }
}