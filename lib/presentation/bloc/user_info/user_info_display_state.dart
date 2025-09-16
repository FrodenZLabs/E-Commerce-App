part of 'user_info_display_cubit.dart';

abstract class UserInfoDisplayState {}

final class UserInfoDisplayLoading extends UserInfoDisplayState {}

final class UserInfoDisplayLoaded extends UserInfoDisplayState {
  final User user;

  UserInfoDisplayLoaded({required this.user});
}

final class UserInfoDisplayFailure extends UserInfoDisplayState {}
