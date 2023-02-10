// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:flutter_weather_api_with_clean_architecture/features/weather/data/models/weather_model.dart';

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImplementation extends RemoteDataSource {
  final Dio dio;
  RemoteDataSourceImplementation({
    required this.dio,
  });

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) {
    // TODO: implement getCurrentWeather
    throw UnimplementedError();
  }
}
