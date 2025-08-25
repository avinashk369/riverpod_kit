import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/user_profile/presentation/user_name_display.dart';
import 'package:riverpod_kit/features/user_profile/providers/user_profile_notifier.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileNotifierProvider);
    // Use ref.listen to listen for changes to the 'name' property.
    ref.listen<String>(
      userProfileNotifierProvider.select((user) => user.name),
      (previousName, newName) {
        if (newName != 'John Doe') {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Name updated to: $newName')));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Watching the entire provider here. This will cause a rebuild
            // whenever any part of the state changes.
            const UserNameDisplay(),
            Text('Email: ${userProfile.email}'),
            Text('Age: ${userProfile.age}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Changing only the age.
                ref
                    .read(userProfileNotifierProvider.notifier)
                    .updateAge(userProfile.age + 1);
              },
              child: const Text('Increase Age'),
            ),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(userProfileNotifierProvider.notifier)
                    .updateName('Jane Doe');
              },
              child: const Text('Update Name'),
            ),
          ],
        ),
      ),
    );
  }
}
