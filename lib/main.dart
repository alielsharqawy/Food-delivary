import 'package:app/data/cubits/auth/login/login_cubit.dart';
import 'package:app/data/cubits/auth/register/register_cubit.dart';
import 'package:app/data/cubits/chats/chats_cubit.dart';
import 'package:app/data/repos/auth/auth_repo.dart';
import 'package:app/data/repos/chats/chats_repo.dart';
import 'package:app/presentation/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/constant/app_router.dart';
import 'package:app/constant/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepo = AuthRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit(authRepo)),
        BlocProvider<RegisterCubit>(create: (_) => RegisterCubit(authRepo)),
        BlocProvider(
          create: (_) => ChatCubit(ChatRepository()),
          child: const ChatScreen(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Carty',
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
