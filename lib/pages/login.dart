import 'package:flutter/material.dart';
import 'package:jio_project/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeBtn = false;
  final _formkey = GlobalKey<FormState>();


  moveToHome (BuildContext context) async {
    if(_formkey.currentState!.validate()) {
      setState(() {
        changeBtn = true;
      });
      await Future.delayed(const Duration(seconds: 1),);
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.00),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.lightBlue,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.00, vertical: 20.00),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Image.asset("assets/images/Login2.png", fit: BoxFit.cover, width: 200.0, height:130.0,),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("WELCOME",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                        {
                          return "Username can not be empty.";
                        }
                      else if(value.length > 8){
                        return "Username length should be minimum 8 characters.";
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Change the border color here
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Change the border color when focused here
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white, // Change the text color here
                    ),
                    validator: (value){
                      if(value!.isEmpty)
                      {
                        return "Password can not be empty.";
                      }
                      else if(value.length > 8){
                        return "Password length should be minimum 8 characters.";
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Change the border color here
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Change the border color when focused here
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      height: 40.00,
                      width: changeBtn? 40: 150,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(changeBtn?25:8),),
                      child:changeBtn?const Icon(Icons.done, color: Colors.white,):const Text("Login",style: TextStyle(color: Colors.white, fontSize: 18.00),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}