import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductColorSelectionCubit extends Cubit<int> {
  ProductColorSelectionCubit() : super(0);

  int selectedIndex = 0;

  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
