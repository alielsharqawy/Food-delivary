import 'package:app/constant/app_color.dart';
import 'package:app/data/cubits/auth/login/login_cubit.dart';
import 'package:app/data/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:app/presentation/home/home_screen.dart';
import 'package:app/presentation/cart/cart_screen.dart';
import 'package:app/presentation/chat/chat_screen.dart';
import 'package:app/presentation/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AuthUser? user = context.read<AuthCubit>().currentUser;

    final List<Widget> screens = [
      const HomeScreen(),
      const CartScreen(),
      const ChatScreen(),
      if (user != null)
        ProfileScreen(email: user.email, name: user.name)
      else
        const Center(child: Text("No user data")),
    ];

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: screens),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: AppColors.secondary,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat),
            title: const Text("Chat"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
