import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        // color: Colors.red,
        child: Column(
          children: [
            // app bar
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 850.h,
                  color: MyColors.primaryYellow,
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 180.h),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(backgroundColor: MyColors.primaryGreen, foregroundColor: MyColors.secondaryYellow, radius: 20,),
                          Text("Halo, User"), 
                          Icon(Icons.notifications, size: 36)
                        ],
                      ),
                    ],
                  )
                ),
                Image.asset(AssetConstraints.bgIntroTop),
                Positioned(
                  bottom: -100.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      boxShadow: [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                      )]
                    ),
                    width: 979.w,
                    padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 64.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Level: A1 Basic (Dasar)"),
                        Container(width: 2, height: 100.h, color: MyColors.lightGrey,),
                        Row(children: [Text("Poin: 8"), Icon(Icons.star_rounded, color: MyColors.primaryYellow,)])
                      ],
                    ),
                  ),
                )
              ],
            )
            // content
          ]
        ),
      ),
    );
  }
}
