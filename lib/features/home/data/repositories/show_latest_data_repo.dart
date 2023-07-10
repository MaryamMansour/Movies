import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/LatestMovie.dart';
import '../../domain/entities/movie_entity.dart';

import '../../domain/repositories/show_popular_domain_repo.dart';
import '../data_sources/show_popular_data_source.dart';


class ShowMoviesDataRepo implements ShowMoviesDomainRepo{

  ShowMoviesDataSource showMoviesDataSource;
  ShowMoviesDataRepo(this.showMoviesDataSource);
  @override

  Future<Either<Failures, MovieEntity>> showPopular()=>showMoviesDataSource.showPopular();
  Future<Either<Failures, MovieEntity>> showTopRated()=>showMoviesDataSource.showTopRated();

  Future<Either<Failures, LatestMovie>> showLatest()=>showMoviesDataSource.showLatest();



}