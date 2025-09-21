import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_boilerplate/core/core.dart';
import 'package:my_boilerplate/features/auth/auth.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.localStorageManager, required this.logoutUsecase})
    : super(const AppInitial()) {
    _checkToken();
  }

  final LocalStorageManager localStorageManager;
  final LogoutUsecase logoutUsecase;

  Future<void> _checkToken() async {
    emit(const AppLoading());
    final token = await localStorageManager.readFromStorage('token');
    if (token != null && token.isNotEmpty) {
      emit(const AppAuthenticated());
    } else {
      emit(const AppUnauthenticated());
    }
  }

  Future<void> logout() async {
    emit(const AppLoading());
    await logoutUsecase.call();
    emit(const AppUnauthenticated());
  }
}
