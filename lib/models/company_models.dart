import 'car_models.dart';

class DataModels{
  final List<CarModels> data;
  DataModels({
    required this.data
  });

  factory DataModels.fromJson(Map<String,dynamic> json){
    return DataModels(data:(json['data'] as List).map((e) => CarModels.fromJson(e)).toList() ?? []);
  }
}
