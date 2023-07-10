import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies/core/api/end_points.dart';
import 'package:movies/core/utils/constants.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/LatestMovie.dart';
import '../../domain/entities/movie_entity.dart';

abstract class ShowMoviesDataSource{

  Future<Either<Failures, MovieEntity>> showPopular();
  Future<Either<Failures, MovieEntity>> showTopRated();
  Future<Either<Failures, LatestMovie>> showLatest();


}

class RemoteDto implements ShowMoviesDataSource{
  Dio dio= Dio();

  @override
  Future<Either<Failures, MovieEntity>> showPopular()async {
    try
    {
    var response = await dio.get
      ("${Constants.baseUrl}${EndPoints.popular}",
    options: Options(headers: {"Authorization":
        Constants.apiToken}))
    ;
    MovieEntity popularMovieEntity=MovieEntity.fromJson(response.data);
    return Right(popularMovieEntity);
    }catch(e){
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, LatestMovie>> showLatest() async{
    try
    {
      var response = await dio.get
        ("${Constants.baseUrl}${EndPoints.latest}",
          options: Options(headers: {"Authorization":
          Constants.apiToken}))
      ;
      LatestMovie movieEntity=LatestMovie.fromJson(response.data);
      return Right(movieEntity);
    }catch(e){
      return Left(ServerFailures(e.toString()));
    }
  }

  Future<Either<Failures, MovieEntity>> showTopRated() async{
    try
    {
      var response = await dio.get
        ("${Constants.baseUrl}${EndPoints.topRated}",
          options: Options(headers: {"Authorization":
          Constants.apiToken}))
      ;
      MovieEntity movieEntity=MovieEntity.fromJson(response.data);
      return Right(movieEntity);
    }catch(e){
      return Left(ServerFailures(e.toString()));
    }
 }


  }







