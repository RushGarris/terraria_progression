import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/class_select_screen.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(title: "Terraria Guide", home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  bool firebaseReady = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((_) => setState(() => firebaseReady = true));
  }

  @override
  Widget build(BuildContext context) {
    if (!firebaseReady) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    print("currentUser = ${FirebaseAuth.instance.currentUser?.email}");

    return const LoginScreen();
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  String? error;
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Enter your email'),
                keyboardType: TextInputType.emailAddress,
                maxLength: 64,
                onChanged: (value) => email = value.trim(),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Enter a password"),
                obscureText: true,
                onChanged: (value) => password = value, 
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'Password must be at least 8 characters.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    tryLogin();
                  }
                },
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Error: $error",
                    style: TextStyle(color: Colors.red[800], fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> tryLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      print("Logged in ${credential.user?.email}");

      setState(() => error = null);

      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ClassSelectScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          error = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          error = 'Wrong password provided for that user.';
        } else if (e.code == 'invalid-credential') {
          error = 'Invalid email/password.';
        } else {
          error = 'Auth error: ${e.message}';
        }
      });
    } catch (e) {
      setState(() => error = e.toString());
    }
  }
  
}
