

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/LatestMovie.dart';
import '../entities/movie_entity.dart';

abstract class ShowMoviesDomainRepo
{
  Future<Either<Failures, MovieEntity>> showPopular();
  Future<Either<Failures, LatestMovie>> showLatest();
  Future<Either<Failures, MovieEntity>> showTopRated();

}