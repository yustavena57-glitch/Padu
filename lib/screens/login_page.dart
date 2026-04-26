import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? errorPassword;

  void handleLogin() {
    setState(() {
      errorPassword = null;
    });

    if (_formKey.currentState!.validate()) {
      if (usernameController.text == "yustavena@gmail.com" &&
          passwordController.text == "12345678") {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        setState(() {
          errorPassword = "Email atau password salah";
        });
      }
    }
  }

  InputDecoration buildInput(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 18),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A47A3),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350, // 🔥 diperkecil dari 350 → 280
            padding: const EdgeInsets.all(16), // 🔥 lebih kecil
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                )
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
            Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
              ),

                const SizedBox(height: 8),

              const Text("PADU",style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold),
              ),
                  const SizedBox(height: 15),

                  TextFormField(
                    controller: usernameController,
                    decoration: buildInput("Email", Icons.person),
                    validator: (value) =>
                        value!.isEmpty ? "Wajib diisi" : null,
                  ),

                  const SizedBox(height: 10),

                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: buildInput("Password", Icons.lock),
                    validator: (value) =>
                        value!.isEmpty ? "Wajib diisi" : null,
                  ),

                  if (errorPassword != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        errorPassword!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 38, // 🔥 lebih kecil
                    child: ElevatedButton(
                      onPressed: handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Login",
                      style: TextStyle(fontSize: 14, 
                      color: Colors.black),
                      ),
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lupa-password');
                    },
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(fontSize: 12),
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
