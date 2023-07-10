import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/features/home/domain/entities/movie_entity.dart';

import 'movie_item.dart';
Widget ShowMovies(
{
  required int length,
  required int height,
  required int width,
  required List<dynamic> results,
})=>
    Container(
      color: Color(0xFF514F4F),
      child: SizedBox(

        height: 250.h,
        child: ListView.builder(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: length,
          itemBuilder: (BuildContext context, int index) =>
              MovieItem(results[index],height,width),


        ),
      ),
    );
