import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MyColors.primaryYellow,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75.sp), bottomRight: Radius.circular(75.sp))
                  ),
                  child: Column(
                    children: [
                      Image.asset(AssetConstraints.bgIntroTop),
                      Container(
                        height: 350.h,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.symmetric(horizontal: 100.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: MyColors.primaryGreen, 
                                  foregroundColor: MyColors.secondaryYellow, radius: 60.h,
                                ),
                                SizedBox(width: 50.w,),
                                Text("Halo, User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.sp),), 
                                SizedBox(width: 50.w,),
                                const Icon(Icons.waving_hand_rounded, color: MyColors.secondaryYellow,)
                              ],
                            ),
                            IconButton(
                              iconSize: 36,
                              icon: const Icon(Icons.notifications),
                              onPressed: () { print("To Notif"); },
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ),
                Positioned(
                  bottom: -100.h,
                  child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      boxShadow: [BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(1, 1),
                        blurRadius: 10,
                      )],
                      borderRadius: BorderRadius.all(Radius.circular(50.sp))
                    ),
                    width: 979.w,
                    padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 64.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Level: A1 Basic (Dasar)", style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)),
                        Container(width: 2, height: 100.h, color: MyColors.lightGrey,),
                        const Row(
                          children: [
                            Text("Poin: 8", style: TextStyle(color: MyColors.primaryGreen, fontWeight: FontWeight.bold)), 
                            Icon(Icons.star_rounded, color: MyColors.primaryYellow,)
                          ])
                      ],
                    ),
                  ),
                )
              ],
            );
  }
}