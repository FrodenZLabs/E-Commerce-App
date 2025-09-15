import 'package:e_commerce_app/domain/usecases/auth/is_logged_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final IsLoggedInUseCase _loggedInUseCase;
  SplashCubit(this._loggedInUseCase) : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 4));
    var isLoggedIn = await _loggedInUseCase();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
