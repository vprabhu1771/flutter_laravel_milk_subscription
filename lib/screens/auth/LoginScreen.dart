import 'package:flutter/material.dart';
import 'package:flutter_laravel_milk_subscription/screens/HomeScreen.dart';
import 'package:flutter_laravel_milk_subscription/screens/auth/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'Customer';

  final List<String> _roles = ['Customer', 'Delivery', 'Admin'];

  String? _mobileNo;
  String? _password;

  bool _obscurePassword = true; // Variable to toggle visibility of the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo at the Top
                Image.asset(
                  'assets/splash_logo.jpg',  // Make sure to add your logo in assets folder
                  height: 100,
                ),
                SizedBox(height: 20),

                Text(
                  "Login",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),

                // Mobile Number Field
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    hintText: 'Enter your mobile number',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (value.length != 10) {
                      return 'Mobile number must be 10 digits';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _mobileNo = value;
                  },
                ),
                SizedBox(height: 15),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),
                SizedBox(height: 15),

                // Role Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  items: _roles.map((role) {
                    return DropdownMenuItem(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: "Select Role",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                ),
                SizedBox(height: 20),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    print("Email: ${_mobileController.text}");
                    print("Password: ${_passwordController.text}");
                    print("Role: $_selectedRole");

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home',))
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                SizedBox(height: 20),

                // Register Button
                ElevatedButton(
                  onPressed: () {
                    print("Email: ${_mobileController.text}");
                    print("Password: ${_passwordController.text}");
                    print("Role: $_selectedRole");

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen(title: 'Home',))
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}