import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final TextEditingController _agencyNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _showPassword = false;

  // Regular expression for password complexity: at least one number, one special character, one lowercase, one uppercase
  static final RegExp _passwordPattern = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()_+{}|<>?]).{8,16}$',
  );

  get hpadding => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 500.0,
            height: 600.0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Scrollbar(
                  trackVisibility : false,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Center(child: Text("Registration", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)),
                          ),
                          TextFormField(
                            controller: _agencyNameController,
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
                          const SizedBox(height: 20),
                          TextFormField(
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
                          const SizedBox(height: 20),
                          TextFormField(
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
                                borderSide: const BorderSide(color: Color(0xFF7F265B)),
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_showPassword,
                            decoration: InputDecoration(
                              hintText: "   Enter Password",
                              labelText: '   Password *',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(color: Color(0xFF7F265B)),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off),
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
                                }else if (value!.length < 8) {
                                  return 'Password is too short (min 8 characters)';
                                } else if (value!.length > 16) {
                                  return 'Password is too long (max 16 characters)';
                                } else if (!_passwordPattern.hasMatch(value)) {
                                  return 'Password must contain at least one number, one special character, one lowercase, and one uppercase letter';
                                }

                              return null;
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _confirmPasswordController,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: '   Confirm Password *',
                                    hintText: "   Enter Confirm Password",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: const BorderSide(color: Color(0xFF7F265B)),
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
                                    } else if (value != _passwordController.text) {
                                      return 'Passwords do not match';
                                    }
                                    return null;
                                  },
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: InkWell(
                              onTap:(){
                                if (_formKey.currentState!.validate()) {
                                  // Registration logic here
                                  // If validation passes, perform the registration
                                  // You can add code here to save the registration data
                                }
                              },
                              child: Container(
                                width: 200.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7F265B), // Set the background color
                                  borderRadius: BorderRadius.circular(40.0), // Apply rounded corners
                                ),

                                child:const Center(child: Text("Login",style: TextStyle(fontSize: 18.00, color: Colors.white),)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
