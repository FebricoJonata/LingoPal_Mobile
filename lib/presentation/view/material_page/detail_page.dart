import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MaterialDetail extends StatefulWidget {
  MaterialDetail({super.key});

  @override
  State<MaterialDetail> createState() => _MaterialDetailState();
}

class _MaterialDetailState extends State<MaterialDetail> {

  MaterialContent material = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String source = material.source!;
    // String? vidId;
    // if(material.type!="Video"){
    //   vidId = YoutubePlayer.convertUrlToId(material.content!);
    // }
    return Scaffold(
      body: Container(
        width: 1179.w,
        height: 2556.h,
        padding: EdgeInsets.fromLTRB(0, 0, 0, 200.h),
        color: MyColors.secondaryYellow,
        child: Column(
          children: [
            Image.asset(AssetConstraints.bgIntroTop),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(right: 30, left: 30, bottom: 100.h),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const BackBtn(),
                          SizedBox(
                            width: 80.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                material.title ?? "Title",
                                style: TextStyle(fontSize: 70.sp, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                material.category ?? "Category",
                                style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold, color: MyColors.primaryGreen),
                              ),
                              InkWell(
                                onTap: () {launchUrlString(source.substring(source.indexOf('http')));},
                                child: Row(
                                  children: [
                                    Text(
                                      source.substring(source.indexOf('(')+1, source.indexOf(')')),
                                      style: TextStyle(fontSize: 50.sp),
                                    ),
                                    SizedBox(width: 30.w,),
                                    Icon(Icons.launch_rounded, size: 50.sp, color: MyColors.primaryGreen,)
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 150.h,), // 
                      Text(material.description!, textAlign: TextAlign.justify,),
                      SizedBox(height: 100.h,),
                      if(material.type=="Article")
                        Column(
                          children: [
                            Image.network(material.cover ?? "https://icons.veryicon.com/png/o/miscellaneous/common-fill-icon/gallery-33.png", height: 100.h, fit: BoxFit.contain,),
                            SizedBox(height: 100.h,),
                            Text(material.content!, textAlign: TextAlign.justify,),
                          ],
                        )
                      else
                        Text("Video url")
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}