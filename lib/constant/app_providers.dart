import 'package:app/data/cubits/auth/login/login_cubit.dart';
import 'package:app/data/cubits/auth/register/register_cubit.dart';
import 'package:app/data/repos/auth/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProviders {
  static final authRepo = AuthRepository();

  static List<BlocProvider> all = [
    BlocProvider<AuthCubit>(
      create: (_) => AuthCubit(authRepo),
    ),
    BlocProvider<RegisterCubit>(
      create: (_) => RegisterCubit(authRepo),
    ),
    // أضف أي BlocProviders آخر هنا
  ];
}
