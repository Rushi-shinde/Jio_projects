import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500.0,
              minHeight: 600.0,
            ),
            child: const LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address.';
    }
    // You can add more complex email validation here if needed.
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
    }
    // You can add more complex password validation here if needed.
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
    ), itemBuilder: (BuildContext context, int index) {
      return TextFormField(
        controller: _passwordController,
        decoration: InputDecoration(
          hintText: "   Enter Password",
          labelText: '   Password *',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide:
            const BorderSide(color: Color(0xFF7F265B)),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password is required';
          } else if (value!.length < 8) {
            return 'Password is too short (min 8 characters)';
          } else if (value!.length > 16) {
            return 'Password is too long (max 16 characters)';
          } else {
            return 'Password must contain at least one number, one special character, one lowercase, and one uppercase letter';
          }

          return null;
        },
        autovalidateMode:
        AutovalidateMode.onUserInteraction,
      );
    },
    );
  }
}

