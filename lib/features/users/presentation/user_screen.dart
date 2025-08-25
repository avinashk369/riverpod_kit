// lib/user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/users/providers/user_provider.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  int _userId = 1;

  @override
  Widget build(BuildContext context) {
    // Watch the provider and pass the current `_userId` to it.
    final userAsyncValue = ref.watch(
      userProvider(userId: _userId, userName: ""),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('User ID: $_userId', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            // The Slider allows us to change the user ID.
            Slider(
              min: 1,
              max: 10,
              divisions: 9,
              value: _userId.toDouble(),
              label: 'User ID: $_userId',
              onChanged: (value) {
                setState(() {
                  _userId = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            // Display the user data based on the AsyncValue state.
            userAsyncValue.when(
              data: (userName) => Text(
                'User Name: $userName',
                style: const TextStyle(fontSize: 18),
              ),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text(
                'Error: $err',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
