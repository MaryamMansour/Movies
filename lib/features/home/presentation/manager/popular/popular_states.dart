
import 'package:movies/features/home/domain/entities/LatestMovie.dart';
import 'package:movies/features/home/domain/entities/movie_entity.dart';

import '../../../../../core/error/failures.dart';

abstract class HomeStates{

}
class HomeInitState extends HomeStates{}
class HomeLoadingState extends HomeStates{

}
class HomePopularSuccessState extends HomeStates{
  MovieEntity movieEntity;
  HomePopularSuccessState( this.movieEntity) ;
}
class HomeTopRatedSuccessState extends HomeStates{
  MovieEntity movieEntity;
  HomeTopRatedSuccessState( this.movieEntity) ;
}
class HomeLatestSuccessState extends HomeStates{
  LatestMovie latestMovie;
  HomeLatestSuccessState( this.latestMovie) ;
}
class HomeErrorState extends HomeStates{
  Failures failures;
  HomeErrorState(this.failures);
}

class ChangeBottomNavBar extends HomeStates{}