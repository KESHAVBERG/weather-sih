import 'package:flutter/material.dart';
import 'package:weather/pages/Home.dart';
import 'package:weather/pages/AuthPages/login.dart';
import 'package:weather/pages/navigatorClass.dart';
import 'package:weather/services/authServices.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30,30,0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Name",
                  fillColor: Colors.white70,
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Email",
                  fillColor: Colors.white70,
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "password",
                  fillColor: Colors.white70,
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  final user = AuthServices().registerUser(emailController.text, passwordController.text);
                  if(user != null){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigatorClass()));
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.orange[400],
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Text("Register", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Text("Already Have a Account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    }, child: Text("SignIn"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
