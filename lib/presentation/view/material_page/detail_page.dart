import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/core/image/image_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';
import 'package:lingo_pal_mobile/presentation/view/components/back_btn.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MaterialDetail extends StatefulWidget {
  const MaterialDetail({super.key});

  @override
  State<MaterialDetail> createState() => _MaterialDetailState();
}

class _MaterialDetailState extends State<MaterialDetail> {
  MaterialContent material = Get.arguments;

  @override
  Widget build(BuildContext context) {
    String? vidId;
    if (material.type == "Video") {
      vidId = YoutubePlayer.convertUrlToId(material.content!);
    }

    var videoController = YoutubePlayerController(
        initialVideoId: vidId ?? "1FEP_sNb62k",
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => SystemChrome.setPreferredOrientations(DeviceOrientation.values),
      child: Scaffold(
        body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: videoController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: MyColors.secondaryGreen,
            progressColors: const ProgressBarColors(playedColor: MyColors.secondaryGreen, handleColor: MyColors.secondaryGreen),
            onReady: () {
              print(videoController.metadata.title);
              // videoController.addListener(listener);
            },
          ),
          builder: (context, player) {
            return Container(
              width: 1179.w,
              height: 2556.h,
              color: MyColors.secondaryYellow,
              child: Column(
                children: [
                  Image.asset(AssetConstraints.bgIntroTop),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(right: 30, left: 30, bottom: 100.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            BackBtn(
                              ontap: () {
                                Get.back();
                              },
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            Expanded(
                              child: Column(
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
                                    onTap: () {
                                      launchUrlString(material.source!);
                                    },
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "View Source",
                                            style: TextStyle(fontSize: 50.sp),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Icon(
                                          Icons.launch_rounded,
                                          size: 50.sp,
                                          color: MyColors.primaryGreen,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: material.description! =="-" || material.description! ==""? 0 : 100.h,
                        ), //
                        Text(
                          material.description!,
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(
                          height: material.description! =="-" || material.description! ==""? 0 : 100.h,
                        ),
                        if (material.type == "Video")
                          player
                        else
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  material.cover!="" && material.cover!="-"?
                                  Image.network(
                                    material.cover,
                                    width: context.width,
                                    fit: BoxFit.contain,
                                  ): const SizedBox(height: 0,),
                                  SizedBox(
                                    height: (material.cover!="" && material.cover!="-")? 100.h : 0.h,
                                  ),
                                  Text(
                                    material.content!,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
