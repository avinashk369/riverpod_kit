import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/user_profile/providers/user_profile_notifier.dart';

class UserNameDisplay extends ConsumerWidget {
  const UserNameDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We are now only selecting the 'name' property.
    final userName = ref.watch(
      userProfileNotifierProvider.select((user) => user.name),
    );
    print('Rebuilding UserNameDisplay widget...');
    return Text(userName);
  }
}
