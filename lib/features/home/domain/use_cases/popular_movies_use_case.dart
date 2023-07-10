
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/movie_entity.dart';

import '../repositories/show_popular_domain_repo.dart';

class ShowPopularUseCase{

  ShowMoviesDomainRepo showMoviesDomainRepo;
  ShowPopularUseCase(this.showMoviesDomainRepo);

  Future<Either<Failures,MovieEntity>>call()=> showMoviesDomainRepo.showPopular();

}