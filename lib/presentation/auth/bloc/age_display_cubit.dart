import 'package:flutter_bloc/flutter_bloc.dart';

import 'age_display_state.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  AgeDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData;
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
