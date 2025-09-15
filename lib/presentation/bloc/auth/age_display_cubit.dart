import 'package:e_commerce_app/domain/usecases/auth/get_ages_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'age_display_state.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  final GetAgesUseCase _agesUseCase;
  AgeDisplayCubit(this._agesUseCase) : super(AgesLoading());

  void displayAges() async {
    var returnedData = await _agesUseCase();
    returnedData.fold(
      (message) {
        emit(AgesLoadFailure(message: message));
      },
      (data) {
        emit(AgesLoaded(ages: data));
      },
    );
  }
}
