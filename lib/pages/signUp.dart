import 'package:flutter/material.dart';
import 'package:weather/pages/Home.dart';
import 'package:weather/pages/login.dart';
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
      body: Container(
        padding: EdgeInsets.all(30),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()));
                }
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text("Register"),
              ),
            ),
            SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignIn()));
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
