// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:flutter_weather_api_with_clean_architecture/features/weather/data/datasources/remote_data_source.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/data/exception.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/data/failure.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/domain/entities/weather.dart';
import 'package:flutter_weather_api_with_clean_architecture/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final RemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(message: ""));
    } on SocketException {
      return const Left(
        ConnectionFailure(message: 'Failed to connect to the network'),
      );
    }
  }
}
