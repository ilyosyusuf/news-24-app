import 'package:flutter/material.dart';
import 'package:newsprogroup/data/user_data.dart';
import 'package:newsprogroup/models/user_model.dart';
import 'package:newsprogroup/screens/sign_in_page.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({ Key? key }) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
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
                    if(value!.isEmpty){
                      return "Please, Fill the line";
                    } else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return "Enter Email!";
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
              const SizedBox(
                height: 65,
              ),
              Stack(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      elevation: 0,
                      fixedSize: Size(150, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
                    ),
                    child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    onPressed: _onPressed,
                  ),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
    _onPressed() {

    int id = UserData.UserList.length;
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      bool isTrue = true;
      for (User user in UserData.UserList) {
        if (email == user.email) {
          isTrue = false;
        }
      }
      if (isTrue == true) {
        UserData.UserList.add(User(id+1, email, password));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> SignInPage()));
      }
      if(isTrue == false){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            dismissDirection: DismissDirection.horizontal,
            backgroundColor: Colors.redAccent,
            content: Text("This email addres is exist in this site"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }

    }
  }

}