import 'package:e_commerce_app/domain/entity/auth/user.dart';
import 'package:e_commerce_app/domain/usecases/auth/get_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'user_info_display_state.dart';

@injectable
class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  final GetUserUseCase _getUserUseCase;
  UserInfoDisplayCubit(this._getUserUseCase) : super(UserInfoDisplayLoading());

  void displayUserInfo() async {
    final returnedData = await _getUserUseCase();
    debugPrint('Return Data: $returnedData');
    returnedData.fold(
      (error) {
        emit(UserInfoDisplayFailure());
      },
      (data) {
        emit(UserInfoDisplayLoaded(user: data));
      },
    );
  }
}
