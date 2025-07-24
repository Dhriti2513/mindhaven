import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRedirector extends StatelessWidget {
  const SplashRedirector({super.key});

  Future<String> _getInitialRoute() async {
    final prefs = await SharedPreferences.getInstance();
    final isOnboarded = prefs.getBool('onboarded') ?? false;
    return isOnboarded ? '/welcome' : '/onboarding';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getInitialRoute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Future.microtask(() {
            Navigator.pushReplacementNamed(context, snapshot.data!);
          });
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
