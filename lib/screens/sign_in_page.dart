import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newsprogroup/screens/sign_up_page.dart';
import 'package:newsprogroup/widgets/sign_in_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({ Key? key }) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
              child: 
                SvgPicture.asset('assets/icons/title.svg'),
            ),
          ),
          const Expanded(
            flex: 4,
            child: SignInWidget()
          ),
          Expanded(
            flex: 3,
            child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
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
                  child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Don’t have an account? Register'),
                    ),
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> SignUpPage()));      
                    },
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