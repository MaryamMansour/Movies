
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/LatestMovie.dart';
import '../entities/movie_entity.dart';

import '../repositories/show_popular_domain_repo.dart';

class ShowLatestUseCase{

   ShowMoviesDomainRepo showMoviesDomainRepo;
  ShowLatestUseCase(this.showMoviesDomainRepo);

  Future<Either<Failures,LatestMovie>>call()=> showMoviesDomainRepo.showLatest();

}