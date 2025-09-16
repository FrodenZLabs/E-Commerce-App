import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'button_state.dart';

@injectable
class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  void execute({dynamic params, required UseCase useCase}) async {
    emit(ButtonLoadingState());
    try {
      final Either returnedData = await useCase.call(params: params);
      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (_) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
