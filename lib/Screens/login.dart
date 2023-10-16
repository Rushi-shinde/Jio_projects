import 'package:flutter/material.dart';
import 'package:jio_project/Screens/registration.dart';

void main() {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = false;

  // Regular expression for password complexity: at least one number, one special character, one lowercase, one uppercase
  static final RegExp _passwordPattern = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}|<>?]).{8,16}$',
  );

  double? h;
  double? w;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Card(
                  child: Container(
                    width: 500,
                    padding: const EdgeInsets.all(40.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                              child: Center(
                                  child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ),

                              TextFormField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                  hintText: "   Enter Username",
                                  labelText: '   Username *',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: const BorderSide(color: Color(0xFF7F265B)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username Name is required';
                                  }
                                  return null;
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),

                              TextFormField(
                                controller: _passwordController,
                                obscureText: !_showPassword,
                                decoration: InputDecoration(
                                  hintText: "   Enter Password",
                                  labelText: '   Password *',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide:
                                    const BorderSide(color: Color(0xFF7F265B)),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(_showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _showPassword = !_showPassword;
                                      });
                                    },
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password is required';
                                  } else if (value!.length < 8) {
                                    return 'Password is too short (min 8 characters)';
                                  } else if (value!.length > 16) {
                                    return 'Password is too long (max 16 characters)';
                                  } else if (!_passwordPattern.hasMatch(value)) {
                                    return 'Password must contain at least one number, one special character, one lowercase, and one uppercase letter';
                                  }

                                  return null;
                                },
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                              ),
                            const SizedBox(height: 30),
                            Center(
                              child: InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  width: 300.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: const Color(
                                        0xFF7F265B),
                                    borderRadius: BorderRadius.circular(
                                        40.0),
                                  ),
                                  child: const Center(
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            fontSize: 18.00, color: Colors.white),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?",style: TextStyle(fontSize: 18.0,color: Color(0xFF7F265B)), ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                InkWell(
                                  onTap:(){
                                    setState(() {
                                      Navigator.pushNamed(context, "/registration");
                                    });
                                  },
                                  child: const Text(
                                    'Sign up',
                                    style: TextStyle(fontSize: 18.0,color: Color(0xFF7F265B)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )));
  }

  Widget textField ( TextEditingController controller, Text hint,){
    return
      TextFormField(
        controller: _userNameController,
        decoration: InputDecoration(
          hintText: "   Enter Username",
          labelText: '   Username *',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(color: Color(0xFF7F265B)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username Name is required';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      );
  }

  void _showPasswordRequirements(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Password Requirements'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. Password must contain at least one lowercase letter.'),
              Text('2. Password must contain at least one uppercase letter.'),
              Text('3. Password must contain at least one special character.'),
              Text('4. Password must contain at least one number.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
