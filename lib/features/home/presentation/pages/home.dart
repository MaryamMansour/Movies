import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/data/data_sources/show_popular_data_source.dart';

import 'package:movies/features/home/presentation/manager/popular/home_cubit.dart';


import '../../../../core/utils/app_colors.dart';
import '../manager/popular/popular_states.dart';

import '../widgets/show_movies_widget.dart';
import '../widgets/show_popular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        BlocProvider(
        create: (context) => HomeCubit(RemoteDto())..showPopular()..showTopRated(),

      child: BlocConsumer<HomeCubit,HomeStates>(
        listener:  (context, state) {

        },
        builder: (context, state) {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Color(0xFF121312),
            bottomNavigationBar: BottomNavigationBar(
               currentIndex: HomeCubit.get(context).bottomNavIndex,
              onTap: (value) {
                 HomeCubit.get(context).changeBottomNav(value);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,color: Colors.amber),
                    label: "",
                    backgroundColor: Colors.black26),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search,color: Colors.amber),
                    label: "",
                   ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.branding_watermark,color: Colors.amber),
                    label: "",
                  ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,color: Colors.amber),
                    label: "",
                   ),
              ],
            ),

            body: HomeCubit.get(context)
                .tabs[HomeCubit.get(context).bottomNavIndex],


          );}




          ),
          );



        }



  }

