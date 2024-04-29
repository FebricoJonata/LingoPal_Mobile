import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lingo_pal_mobile/core/color/color_constraint.dart';

import '../../../core/image/image_constraint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryYellow,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: MyColors.white,
        backgroundColor: MyColors.primaryYellow,
        items: const <Widget>[
          Icon(Icons.home, color: MyColors.primaryGreen),
          Icon(Icons.menu_book_rounded, color: MyColors.primaryGreen),
          Icon(Icons.chat_bubble, color: MyColors.primaryGreen),
          Icon(Icons.video_collection, color: MyColors.primaryGreen),
          Icon(Icons.person, color: MyColors.primaryGreen),
        ],
        onTap: (index) {
          setState(() {
            // switch (index) {
            //   case 0:
            //     Navigator.pushReplacementNamed(context, '/home');
            //     break;
            //   case 1:
            //     Navigator.pushReplacementNamed(context, '/books');
            //     break;
            //   case 2:
            //     Navigator.pushReplacementNamed(context, '/chat');
            //     break;
            //   case 3:
            //     Navigator.pushReplacementNamed(context, '/videos');
            //     break;
            //   case 4:
            //     Navigator.pushReplacementNamed(context, '/profile');
            //     break;
            //   default:
            //     break;
            // }
          });
        },
      ),
      body: SizedBox(
        width: 1179.w,
        height: 2556.h,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 1179.w,
                height: 2556.h,
                child: Column(
                  children: [
                    Flexible(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          AssetConstraints.bgIntroTop,
                        ),
                      ),
                    ),
                    Text("Halo User!"),
                    Text("Total poin")
                    // tambahin widget dibawah
                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}
