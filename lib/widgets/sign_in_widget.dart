import 'package:flutter/material.dart';
import 'package:newsprogroup/data/user_data.dart';
import 'package:newsprogroup/models/user_model.dart';
import 'package:newsprogroup/screens/main_page.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({ Key? key }) : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isShow = true;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3340,
      height: 333,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: "Email",
                ),
                validator:(value) {
                  if (value!.isEmpty) {
                    return "Please, Fill the line";
                  }
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                obscureText: _isShow,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: "Password",
                  
                  suffixIcon: IconButton( icon: Icon(Icons.remove_red_eye, color: Colors.grey,),
                    onPressed: (){
                      setState(() {
                        _isShow = !_isShow;
                      });
                    },
                  ),
                ),
                validator:(value) {
                  if (value!.isEmpty) {
                    return "Please, Fill the line";
                  }
                },
              ),
              Stack(
                children: const [
                  SizedBox(
                    width: double.infinity,
                    height: 65,
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: InkWell(
                      child: Text("Forgot password?"),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 0,
                  fixedSize: const Size(150, 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                ),
                child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                onPressed: _onPressed,
              )
            ],
          )
        ),
      ),
    );
  }
  _onPressed(){
    String email = _emailController.text;
    String password = _passwordController.text;
    if(_formKey.currentState!.validate()){
      for (User user in UserData.UserList) {
        if(email == user.email && password == user.password){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> MainPage()));
          return true;
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.redAccent,
          content: Text("wrong input, please enter correctly or Sign up first"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

}