import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsprogroup/core/colors/mycolor.dart';
import 'package:newsprogroup/widgets/second_app_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}


class _SettingsPageState extends State<SettingsPage> {

  static bool isDark = false;
  List<SvgPicture> icons = [];

  static Color? color = Colors.black;
  List<String> names = [
    "Account",
    "Dark/Light Mode",
    "Terms & Conditions",
    "About",
    "Log Out",
  ];
  @override
  void initState() {
    super.initState();
    icons = [
      SvgPicture.asset('assets/icons/account.svg', color: ColorConst.kBlack),
      SvgPicture.asset('assets/icons/notification.svg', color: ColorConst.kBlack,),
      SvgPicture.asset('assets/icons/about.svg', color: ColorConst.kBlack,),
      SvgPicture.asset('assets/icons/about.svg', color: ColorConst.kBlack,),
      SvgPicture.asset('assets/icons/logout.svg', color: ColorConst.kBlack,),
    ];
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: MySecondAppbar(title: "Settings",),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, i) {
            return ListTile(
              leading: icons[i],
              title: Text(names[i]),
              trailing: i == 1 ? 
                Switch(
              value: isDark,
              onChanged: (v){
                isDark = v;
                if(isDark){
                  AdaptiveTheme.of(context).setDark();
                  ColorConst.kBlack = Colors.white;
                  ColorConst.kWhite = Colors.black;
                  setState(() {
                    
                  });
                }else{
                  AdaptiveTheme.of(context).setLight();
                  ColorConst.kBlack = Colors.black;
                  ColorConst.kWhite = Colors.white;
                  setState(() {
                    
                  });
                }
                setState(() {});
              }
            ) : Icon(Icons.chevron_right_rounded)
            );
          }),
        ),
      ],
    );
  }
}