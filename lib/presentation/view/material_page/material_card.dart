import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';
import 'package:lingo_pal_mobile/presentation/model/material_model/material_model.dart';

class MaterialCard extends StatelessWidget {
  MaterialCard({super.key, required this.material});

  final MaterialContent material;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 15,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.sp)),
            color: Colors.white
          ),
          padding: EdgeInsets.all(36.sp),
          height: 300.h,
          child: Row(
            children: [
              Image.network("https://icons.veryicon.com/png/o/miscellaneous/common-fill-icon/gallery-33.png", width: 150.w, height: 150.w, fit: BoxFit.cover,),
              SizedBox(width: 80.w,),
              Flexible(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Content Title", style: TextStyle(fontSize: 44.sp, fontWeight: FontWeight.bold),),
                  Text("Content Category", style: TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold, color: MyColors.primaryGreen),),
                  Text("Content source", style: TextStyle(fontSize: 32.sp),)
                ],),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // to view
      },
    );
  }
}