// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/data/failure.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/domain/entities/weather.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/domain/repositories/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository weatherRepository;
  GetCurrentWeather({
    required this.weatherRepository,
  });

  Future<Either<Failure, Weather>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
