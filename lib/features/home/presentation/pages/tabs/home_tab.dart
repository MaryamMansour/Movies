import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/data_sources/show_popular_data_source.dart';

import 'package:movies/features/home/presentation/manager/popular/home_cubit.dart';

import '../../manager/popular/popular_states.dart';
import '../../widgets/show_movies_widget.dart';
import '../../widgets/show_popular.dart';



class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => HomeCubit(RemoteDto())..showPopular()..showTopRated(),

        child: BlocConsumer<HomeCubit,HomeStates>(
            listener:  (context, state) {
              if (state is HomeLoadingState) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: Center(
                      child: CircularProgressIndicator(
                      ),
                    ),
                  ),
                );
              } else if (state is HomeErrorState) {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Error"),
                    content: Text(state.failures.message ?? ""),
                  ),
                );
              } else if (state is HomePopularSuccessState) {

              }
            },
            builder: (context, state) {
              return  Scaffold(

                backgroundColor: Color(0xFF121312),

                body:

                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Popular',
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600, color:Colors.white ),
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 20.h,),
                      ShowPopularMovies(length:  HomeCubit.get(context).popularResult.length, results:  HomeCubit.get(context).popularResult,height:320,width: 420),
                      Text(
                        'Latest',
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600, color:Colors.white ),
                        textAlign: TextAlign.start,
                      ),
                      ShowMovies(length:  1, results:  HomeCubit.get(context).latestResult,height: 200,width: 150),
                      Text(
                        'Top Rated',
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600, color:Colors.white ),
                        textAlign: TextAlign.start,
                      ),
                      ShowMovies(length: HomeCubit.get(context).topRatedResult.length , results:  HomeCubit.get(context).topRatedResult,height: 200,width: 150),


                    ],
                  ),),
              );}




        ),
      );



  }



}

