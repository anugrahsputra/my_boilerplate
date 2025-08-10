import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_boilerplate/core/core.dart';

enum AppStatus { initial, loading, authenticated, unauthenticated }

class AppCubit extends Cubit<AppStatus> {
  final LocalStorageManager localStorageManager;

  AppCubit({required this.localStorageManager}) : super(AppStatus.initial) {
    _checkToken();
  }

  Future<void> _checkToken() async {
    emit(AppStatus.loading);
    final token = await localStorageManager.readFromStorage("token");
    if (token != null && token.isNotEmpty) {
      emit(AppStatus.authenticated);
    } else {
      emit(AppStatus.unauthenticated);
    }
  }

  Future<void> logout() async {
    await localStorageManager.deleteFromStorage('token');
    emit(AppStatus.unauthenticated);
  }
}
