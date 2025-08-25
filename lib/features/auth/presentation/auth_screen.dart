import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/auth/presentation/providers/auth_providers.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Auth Screen')),
      body: Center(
        child: authState == null
            ? ElevatedButton(
                onPressed: () {
                  ref.read(authProvider.notifier).signIn(' ', 'password');
                },
                child: const Text('Sign In'),
              )
            : authState.isLoading
            ? Center(child: const CircularProgressIndicator(color: Colors.red))
            : authState.hasError
            ? Text('Error: ${authState.error}')
            : Text('User: ${authState.value?.email}'),
      ),
    );
  }
}
