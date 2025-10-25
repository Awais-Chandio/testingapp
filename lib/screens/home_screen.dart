import 'package:flutter/material.dart';
import '../models/login_response.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  String _extractUsername(LoginResponse? response) {
    if (response == null) return 'User';
    final data = response.data;
    if (data == null) return 'User';

    // Prefer username, then name, then email-before-@
    if (data['username'] != null && data['username'].toString().trim().isNotEmpty) {
      return data['username'].toString();
    }
   
    if (data['email'] != null && data['email'].toString().contains('@')) {
      return data['email'].toString().split('@').first;
    }
    return 'User';
  }

  @override
  Widget build(BuildContext context) {
    final LoginResponse? response = ModalRoute.of(context)!.settings.arguments as LoginResponse?;
    final username = _extractUsername(response);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'You have successfully logged in.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
