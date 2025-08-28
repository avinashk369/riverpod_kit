import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_kit/features/auth/presentation/auth_screen.dart';
import 'package:riverpod_kit/features/cc_arch/presentation/pages/user_page.dart';
import 'package:riverpod_kit/features/counter/presentation/counter_screen.dart';
import 'package:riverpod_kit/features/quote/presentation/quote_screen.dart';
import 'package:riverpod_kit/features/todo_x/presentation/todo_app.dart';
import 'package:riverpod_kit/features/user_posts/presentation/user_post_screen.dart';
import 'package:riverpod_kit/features/user_profile/presentation/profile_screen.dart';

class StarterKit extends StatelessWidget {
  const StarterKit({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: UserPage(userId: 2),
      ),
    );
  }
}
