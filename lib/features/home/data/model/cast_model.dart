class CastModel {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castIId;
  String? character;
  String? creditId;
  int? order;

  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.castIId,
      this.character,
      this.creditId,
      this.order});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return  CastModel(
    id: json['id'],
      knownForDepartment: json['known_for_department'],
      adult: json['adult'],
      gender: json['gender'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
      castIId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      order: json['order']
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castIId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}
