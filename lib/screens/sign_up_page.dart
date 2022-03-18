import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsprogroup/widgets/sign_in_widget.dart';
import 'package:newsprogroup/widgets/sign_up_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: SizedBox()
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: 
                SvgPicture.asset('assets/icons/title.svg'),
            ),
          ),
          const Expanded(
            flex: 4,
            child: SignUpWidget()
          ),
          Expanded(
            flex: 3,
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: const [
                        Expanded(child: Divider(thickness: 2)),
                        SizedBox(width: 10.0),
                        Text("or sign in with"),
                        SizedBox(width: 10.0),
                        Expanded(child: Divider(thickness: 2,))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/icons/email.svg'),
                      SvgPicture.asset('assets/icons/google.svg'),
                      SvgPicture.asset('assets/icons/facebook.svg'),
                      SvgPicture.asset('assets/icons/twitter.svg'),
                      SvgPicture.asset('assets/icons/apple.svg'),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: const [
                        Text('By signing up to News24 you are accepting our', style: TextStyle(fontSize: 16),),
                        Text('Terms & Conditions', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                )
              ]
            )
          )
        ],
      ),
    );
  }
}