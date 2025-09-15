import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  final UseCase useCase;
  ButtonCubit(this.useCase) : super(ButtonInitialState());

  void execute({dynamic params}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await useCase.call(params: params);
      returnedData.fold(
        (error) {
          emit(ButtonFailureState(errorMessage: error));
        },
        (data) {
          emit(ButtonSuccessState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
