import 'package:app/data/models/auth_model.dart'; // for AuthUser
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import 'package:app/data/repos/auth/auth_repo.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.login(email: email, password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  AuthUser? get currentUser {
    if (state is AuthSuccess) {
      return (state as AuthSuccess).user;
    }
    return null;
  }
}
