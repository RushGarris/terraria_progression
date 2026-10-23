import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../services/guest_mode.dart';
import '../theme/app_theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _toast(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      _toast(e.message ?? 'Authentication failed');
    } catch (e) {
      _toast('Something went wrong');
    }
  }

  Future<void> register() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      _toast('Register failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SkyScaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    size: 56,
                    color: AppColors.gold,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'TERRARIA GUIDE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.gold,
                      fontSize: 18,
                      shadows: const [
                        Shadow(color: Colors.black54, offset: Offset(2, 3)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Gear up for every boss',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.mail_outline),
                            ),
                          ),
                          const SizedBox(height: 14),
                          TextField(
                            controller: passwordController,
                            obscureText: true,
                            onSubmitted: (_) => signIn(),
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(Icons.lock_outline),
                            ),
                          ),
                          const SizedBox(height: 22),
                          FilledButton(
                            onPressed: signIn,
                            child: const Text('Login'),
                          ),
                          const SizedBox(height: 10),
                          OutlinedButton(
                            onPressed: register,
                            child: const Text('Register'),
                          ),
                          const SizedBox(height: 6),
                          TextButton(
                            onPressed: GuestMode.enter,
                            child: const Text('Continue as guest'),
                          ),
                        ],
                      ),
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
