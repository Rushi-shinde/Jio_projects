import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jio_project/DatabaseHandler/DatabaseHelper.dart';

import '../models/SignupModel.dart';

void main() {
  runApp(const MaterialApp(
    home: RegistrationPage(),
  ));
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController(text: 'rushi');
  final TextEditingController _emailController = TextEditingController(text: 'Shinde@gmail.com');
  final TextEditingController _mobileController = TextEditingController(text: '9326064627');
  final TextEditingController _genderController = TextEditingController(text: 'Male');
  final TextEditingController _passwordController = TextEditingController(text: 'Shinde@123');
  final TextEditingController _confirmPasswordController = TextEditingController(text: 'Shinde@123');


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
                  width: 800,
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
                              "SIGN UP",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          if(w !>=600)
                          Row(

                            //mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: TextFormField(
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
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Flexible(
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: "   Enter Email",
                                    labelText: '   Email ID *',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(color: Color(0xFF7F265B)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email ID is required';
                                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              ),
                            ],
                          ),
                          if(w !<=600)
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: TextFormField(
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
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                SizedBox(
                                  child: TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      hintText: "   Enter Email",
                                      labelText: '   Email ID *',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(color: Color(0xFF7F265B)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Email ID is required';
                                      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                                        return 'Enter a valid email address';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                              ],
                            ),



                          const SizedBox(height: 20),


                          if(w !>=600)
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: _mobileController,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    hintText: "   Enter Mobile no",
                                    labelText: '   Mobile No *',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide:
                                          const BorderSide(color: Color(0xFF7F265B)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Mobile No is required';
                                    } else if (value?.length != 10) {
                                      return 'Mobile No must be exactly 10 digits';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                child: TextFormField(
                                  controller: _genderController,
                                  decoration: InputDecoration(
                                    hintText: "   Enter Gender",
                                    labelText: '   Gender *',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(color: Color(0xFF7F265B)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Gender is required';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              ),

                            ],
                          ),
                          if(w !<=600)
                            Column(
                              children: [
                                SizedBox(
                                  child: TextFormField(
                                    controller: _mobileController,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(10),
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: "   Enter Mobile no",
                                      labelText: '   Mobile No *',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide:
                                        const BorderSide(color: Color(0xFF7F265B)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Mobile No is required';
                                      } else if (value?.length != 10) {
                                        return 'Mobile No must be exactly 10 digits';
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "   Enter Gender",
                                      labelText: '   Gender *',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(color: Color(0xFF7F265B)),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Gender is required';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                ),

                              ],
                            ),

                          const SizedBox(height: 20),

                          if(w !>=600)
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
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
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: '   Confirm Password *',
                                    hintText: "   Enter Confirm Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF7F265B)),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.info_outline),
                                      onPressed: () {
                                        _showPasswordRequirements(context);
                                      },
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password is required';
                                    } else if (value !=
                                        _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                                ),
                              ),
                            ],
                          ),

                          if(w !<=600)
                            Column(
                              children: [
                                SizedBox(
                                  child: TextFormField(
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
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  child: TextFormField(
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: '   Confirm Password *',
                                      hintText: "   Enter Confirm Password",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30.0),
                                        borderSide: const BorderSide(
                                            color: Color(0xFF7F265B)),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.info_outline),
                                        onPressed: () {
                                          _showPasswordRequirements(context);
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Confirm Password is required';
                                      } else if (value !=
                                          _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                  ),
                                ),
                              ],
                            ),

                          const SizedBox(height: 30),
                          Center(
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  final newUser = User(
                                    username: _userNameController.text,
                                    email: _emailController.text,
                                    mobile: _mobileController.text,
                                    gender: _mobileController.text,
                                    password: _passwordController.text,
                                  );
                                  DatabaseHelper().insertUser(newUser).then((userId) {
                                    print(userId);
                                      if (userId != null && userId > 0) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Registration successful!'),
                                          ),
                                        );
                                        Navigator.pushNamed(context, '/login');
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Registration failed. Please try again.'),
                                          ),
                                        );
                                      }
                                  }).catchError((error) {
                                    Text('Error during registration: $error');
                                  });
                                }
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
                                  "SIGN UP",
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
                              const Text("Already have an account?",style: TextStyle(fontSize: 18.0,color: Color(0xFF7F265B)), ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    Navigator.pushNamed(context, "/login");
                                  });
                                },
                                child: const Text(
                                  'Login',
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
