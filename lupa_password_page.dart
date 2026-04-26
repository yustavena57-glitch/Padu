import 'package:flutter/material.dart';

class LupaPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  InputDecoration buildInput(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 18),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
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
            width: 280,
            padding: const EdgeInsets.all(16),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.lock_reset,
                  size: 50,
                  color: Colors.deepPurple,
                ),

                const SizedBox(height: 8),

                const Text(
                  "Lupa Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: emailController,
                  decoration: buildInput("Masukkan Email", Icons.email),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Link reset password dikirim"),
                        ),
                      );

                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.pop(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "KIRIM",
                      style: TextStyle(fontSize: 14, 
                      color: Colors.black),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Kembali",
                    style: TextStyle(fontSize: 12),
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