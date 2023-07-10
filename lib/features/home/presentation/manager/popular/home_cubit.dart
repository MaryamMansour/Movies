import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/features/home/domain/entities/LatestMovie.dart';
import 'package:movies/features/home/domain/use_cases/show_toprated_use_case.dart';

import 'package:movies/features/home/presentation/manager/popular/popular_states.dart';

import '../../../data/data_sources/show_popular_data_source.dart';
import '../../../data/repositories/show_latest_data_repo.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/repositories/show_popular_domain_repo.dart';
import '../../../domain/use_cases/latest_movies_use_case.dart';
import '../../../domain/use_cases/popular_movies_use_case.dart';
import '../../pages/tabs/category_tab.dart';
import '../../pages/tabs/home_tab.dart';
import '../../pages/tabs/search_tab.dart';
import '../../pages/tabs/watchlist_tab.dart';

class HomeCubit extends Cubit<HomeStates>
{
  List<Results>popularResult=[];
  List<Results>topRatedResult=[];
  List<LatestMovie> latestResult=[];
 int bottomNavIndex=0;
  ShowMoviesDataSource source;

  List<Widget> tabs = const [HomeTab(),SearchTab(), CategoryTab(), WatchListTab() ];


  HomeCubit(this.source):super(HomeInitState());
  static HomeCubit get(context) => BlocProvider.of(context);




  void changeBottomNav(int index) {
    emit(HomeInitState());
    bottomNavIndex = index;
    emit(ChangeBottomNavBar());
  }



  Future<void> showPopular()async{
    emit(HomeInitState());
    ShowMoviesDomainRepo showMoviesDomainRepo= ShowMoviesDataRepo(source);
    ShowPopularUseCase showPopularUseCase= ShowPopularUseCase(showMoviesDomainRepo);
    var result = await showPopularUseCase.call();
    result.fold((l){
      emit(HomeErrorState(l));
    },
    (r){
      popularResult=r.results!;
    emit(HomePopularSuccessState(r));
  });

}


  Future<void> showLatest()async{

    emit(HomeInitState());
    ShowMoviesDomainRepo showMoviesDomainRepo= ShowMoviesDataRepo(source);
    ShowLatestUseCase showLatsetUseCase= ShowLatestUseCase(showMoviesDomainRepo);
    var result = await showLatsetUseCase.call();
    result.fold((l){
      emit(HomeErrorState(l));
    },
            (r){
          latestResult[0]=r;

          print(latestResult.length);
          print(latestResult[0].posterPath);
          emit(HomeLatestSuccessState(r));
        });

  }




  Future<void> showTopRated()async{
   // print("HI 1 ");
    emit(HomeInitState());
    ShowMoviesDomainRepo showMoviesDomainRepo= ShowMoviesDataRepo(source);
    ShowTopRatedUseCase showTopRatedUseCase= ShowTopRatedUseCase(showMoviesDomainRepo);
    var result = await showTopRatedUseCase.call();
    result.fold((l){
      emit(HomeErrorState(l));
    },
            (r){
              topRatedResult=r.results!;
          emit(HomeTopRatedSuccessState(r));
        });

  }


}


















