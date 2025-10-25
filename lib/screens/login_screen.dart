import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_cubit.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(); // now empty
  final _passwordController = TextEditingController(); // now empty

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (!_formKey.currentState!.validate()) return;
    final cubit = context.read<LoginCubit>();
    cubit.login(email: _emailController.text.trim(), password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No plain AppBar — a clean status bar + gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == LoginStatus.success) {
                  Navigator.of(context).pushReplacementNamed(
                    HomeScreen.routeName,
                    arguments: state.response,
                  );
                } else if (state.status == LoginStatus.error) {
                  final message = state.errorMessage ?? 'Unknown error';
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
                }
              },
              builder: (context, state) {
                final loading = state.status == LoginStatus.loading;
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Title
                          Text(
                            'Welcome Back',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Sign in to continue',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 20),

                          // Email field
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              prefixIcon: const Icon(Icons.email_outlined),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (v) {
                              if (v == null || v.isEmpty) return 'Please enter email';
                              if (!v.contains('@')) return 'Enter a valid email';
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),

                          // Password field
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock_outline),
                              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            obscureText: true,
                            validator: (v) => (v == null || v.isEmpty) ? 'Please enter password' : null,
                          ),
                          const SizedBox(height: 20),

                          // Login button
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                elevation: 4,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: loading ? null : _onLoginPressed,
                              child: loading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                    )
                                  : const Text('Login', style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Optional: small helper text
                          const Text(
                            'Use your account credentials to login.',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
