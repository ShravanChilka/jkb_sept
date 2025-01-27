import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jkb_sept/modules/explore/model/wallapaper_response_model.dart';

import '../../../core/env_service.dart';

class ExploreRemoteService {
  final _client = Dio(
    BaseOptions(
      headers: {
        'Authorization': EnvService.apiKey,
      },
    ),
  );

  // CRUD
  // Create - POST
  // Read - GET
  // Update - PATCH, PUT
  // Delete - DELETE

  Future<Either<String, WallapaperResponseModel>> getWallpapers() async {
    try {
      final response = await _client.get(
        'https://api.pexels.com/v1/curated',
        queryParameters: {
          'page': 1,
          'per_page': 5,
        },
      );
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final result = WallapaperResponseModel.fromMap(response.data);
        return Right(result);
      }
      return const Left('Something went wrong!');
    } on DioException catch (e) {
      return Left(e.message ?? 'Something went wrong!');
    }
  }
}
