class PlaceModel {
  PlaceModel({
    required this.placeCategory,
    required this.lat,
    required this.long,
    required this.placeName,
    required this.entrance,
    required this.flatNumber,
    required this.orientAddress,
    required this.stage,
    required this.id,
  });

  final int id;
  String lat;
  String long;
  String placeName;
  String placeCategory;
  String entrance;
  String stage;
  String flatNumber;
  String orientAddress;

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      placeName: json['place_name'] as String? ?? "",
      entrance: json['entrance'] as String? ?? "",
      stage: json['stage'] as String? ?? "",
      flatNumber: json['flatNumber'] as String? ?? '',
      orientAddress: json['orient_address'] as String? ?? "",
      placeCategory: json['place_category'] as String? ?? "",
      lat: json['lat'] as String? ?? "",
      long: json['long'] as String? ?? "",
      id: json['id'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place_name': placeName,
      'entrance': entrance,
      'stage': stage,
      'flat_number': flatNumber,
      'orient_address': orientAddress,
      'place_category': placeCategory,
      'lat': lat,
      'long': long,
      'id': id,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'place_name': placeName,
      'entrance': entrance,
      'stage': stage,
      'flat_number': flatNumber,
      'orient_address': orientAddress,
      'place_category': placeCategory,
      'lat': lat,
      'long': long,
      'id': id,
    };
  }

  PlaceModel copyWith({
    String? placeName,
    String? entrance,
    String? stage,
    String? flatNumber,
    String? orientAddress,
    String? placeCategory,
    String? lat,
    String? long,
    int? id,
  }) {
    return PlaceModel(
      placeName: placeName ?? this.placeName,
      entrance: entrance ?? entrance!,
      stage: stage ?? this.stage,
      flatNumber: flatNumber ?? this.flatNumber,
      orientAddress: orientAddress ?? this.orientAddress,
      placeCategory: placeCategory ?? this.placeCategory,
      lat: lat ?? this.lat,
      long: long ?? this.long,
      id: id ?? this.id,
    );
  }
}
