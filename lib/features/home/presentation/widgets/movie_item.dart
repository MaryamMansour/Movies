import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../domain/entities/movie_entity.dart';

class MovieItem extends StatelessWidget {
  bool rad=true;
  int height;
  int width;
  Results results;
  MovieItem(this.results,this.height,this.width);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,

        color: Colors.transparent,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Colors.transparent
          )
      ),
      child: Column(

        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: ("https://image.tmdb.org/t/p/original/${results.posterPath}"??""),
              height: height.h,
              width: width.w,
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

          ),
          //
          // Text(results.title??"", style: TextStyle(
          //   fontSize: 16.sp,fontWeight: FontWeight.bold,
          // ),maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          //
          // Text(results.overview??"",style: TextStyle(
          //     fontSize: 13.sp,color: Colors.black54
          // ),maxLines: 2,
          //   overflow: TextOverflow.ellipsis,),
          //
          //
          // Text(results.releaseDate?.substring(0,10)??"",
          //   style: TextStyle(
          //       fontSize: 10.sp,color: Colors.black54
          //   ),
          //   textAlign:TextAlign.end,),
        ],
      ),
    );

  }
}
