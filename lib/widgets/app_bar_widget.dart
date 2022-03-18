import 'package:flutter/material.dart';
import 'package:newsprogroup/core/constants/icon_const.dart';

class MyAppbar {
  static get myAppbar => AppBar(
      shadowColor: Colors.transparent,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: IconConst.logo),
          Container(
            width: 10
          ),
          const Text(
            'News 24',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ],
      ),
      actions: [
          Container(
            width: 25,
            height: 25,
            margin: EdgeInsets.only(right: 10),
            child: IconConst.notification), 
        ],
    );
}