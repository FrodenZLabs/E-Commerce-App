import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);

  int selectedIndex = 1;

  void selectGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
