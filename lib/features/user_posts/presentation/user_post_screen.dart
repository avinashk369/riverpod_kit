// lib/user_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/user_posts/providers/user_data_provider.dart';

class UserPostScreen extends ConsumerWidget {
  final int userId;
  const UserPostScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDataAsync = ref.watch(userDataProvider(userId, ""));

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: userDataAsync.when(
        data: (userData) => SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User Name: ${userData.name}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Posts:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ...userData.posts.map((post) => Text('• $post')),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
