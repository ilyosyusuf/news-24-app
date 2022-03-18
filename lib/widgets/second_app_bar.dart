// import 'package:flutter/material.dart';
// import 'package:newsprogroup/core/constants/icon_const.dart';

// class MySecondAppbar {
//   static get myAppbar => AppBar(
//       shadowColor: Colors.transparent,
//       title: Text(),
//       // title: Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   crossAxisAlignment: CrossAxisAlignment.center,
//       //   children: [
//       //     Container(
//       //       margin: const EdgeInsets.only(left: 30),
//       //       child: IconConst.logo),
//       //     Container(
//       //       width: 10
//       //     ),
//       //     const Text(
//       //       'News 24',
//       //       style: TextStyle(
//       //         color: Colors.black
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       // actions: [
//       //     Container(
//       //       width: 25,
//       //       height: 25,
//       //       margin: EdgeInsets.only(right: 10),
//       //       child: IconConst.notification), 
//       //   ],
//     );
// }

import 'package:flutter/material.dart';
import 'package:newsprogroup/core/colors/mycolor.dart';

class MySecondAppbar extends StatelessWidget {
  String title;
  MySecondAppbar({ Key? key, required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      title: Text(title, style: TextStyle(color: ColorConst.kBlack),),
    );
  }
}