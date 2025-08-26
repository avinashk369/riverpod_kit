import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/core/errors/network_failure.dart';
import 'package:riverpod_kit/core/errors/server_failure.dart';

class UserPage extends ConsumerWidget {
  final int userId;
  const UserPage({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userNotifierProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: userAsyncValue.when(
          data: (user) {
            return Card(
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ${user.name}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Username: ${user.username}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'ID: ${user.id}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) {
            String message;
            if (error is ServerFailure) {
              message = error.message ?? 'Server error occurred.';
            } else if (error is NetworkFailure) {
              message = 'Please check your internet connection.';
            } else {
              message = 'An unexpected error occurred.';
            }
            return Text(message, style: const TextStyle(color: Colors.red));
          },
        ),
      ),
    );
  }
}
