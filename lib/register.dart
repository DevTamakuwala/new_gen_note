import 'package:flutter/material.dart';
import 'package:new_gen_note/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controllerFullName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.orange, Colors.yellow]),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 70, left: 20),
                  child: Text(
                    "Welcome,",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controllerFullName,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter full name';
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.orange),
                          labelText: 'Full Name',
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Full Name',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerEmail,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter email';
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email, color: Colors.orange),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Email',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerUsername,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter username';
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.account_circle, color: Colors.orange),
                          labelText: 'Username',
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Username',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerPassword,
                        obscureText: !isPasswordVisible,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please enter password';
                          if (value.length < 6) return 'Password must be at least 6 characters';
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, color: Colors.orange),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Password',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controllerConfirmPassword,
                        obscureText: !isConfirmPasswordVisible,
                        validator: (value) {
                          if (value!.isEmpty) return 'Please confirm password';
                          if (value != controllerPassword.text) return 'Passwords do not match';
                          return null;
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock, color: Colors.orange),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              setState(() {
                                isConfirmPasswordVisible = !isConfirmPasswordVisible;
                              });
                            },
                          ),
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Re-enter Password',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Handle registration
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        ),
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              // Navigate to LoginPage
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.orange),
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
        ],
      ),
    );
  }
}
