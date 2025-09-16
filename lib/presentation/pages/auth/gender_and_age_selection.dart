import 'package:e_commerce_app/core/configs/theme/app_colors.dart';
import 'package:e_commerce_app/core/di/injection.dart';
import 'package:e_commerce_app/core/helper/bottomsheet/app_bottomsheet.dart';
import 'package:e_commerce_app/data/models/auth/user_creation_model.dart';
import 'package:e_commerce_app/domain/usecases/auth/sign_up_use_case.dart';
import 'package:e_commerce_app/presentation/bloc/auth/age_display_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/auth/age_selection_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/auth/gender_selection_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/button/button_cubit.dart';
import 'package:e_commerce_app/presentation/bloc/button/button_state.dart';
import 'package:e_commerce_app/presentation/widgets/ages.dart';
import 'package:e_commerce_app/presentation/widgets/app_bar.dart';
import 'package:e_commerce_app/presentation/widgets/basic_reactive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelection extends StatelessWidget {
  final UserCreationModel userCreationReq;
  const GenderAndAgeSelection({super.key, required this.userCreationReq});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(),
      body: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonFailureState) {
            var snackBar = SnackBar(
              content: Text(state.errorMessage),
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell us about yourself',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),

                  BlocBuilder<GenderSelectionCubit, int>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          genderTile(context, 1, 'Men'),
                          const SizedBox(width: 20),
                          genderTile(context, 2, 'Women'),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'How old are you?',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 30),
                  _age(),
                ],
              ),
            ),
            const Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color:
                context.read<GenderSelectionCubit>().selectedIndex ==
                    genderIndex
                ? AppColors.primary
                : AppColors.secondBackground,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                  BlocProvider.value(
                    value: context.read<AgeDisplayCubit>()..displayAges(),
                  ),
                ],
                child: const Ages(),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
            ),
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(
          builder: (context) {
            return BasicReactiveButton(
              onPressed: () {
                userCreationReq.gender = context
                    .read<GenderSelectionCubit>()
                    .selectedIndex;
                userCreationReq.age = context
                    .read<AgeSelectionCubit>()
                    .selectedAge;
                context.read<ButtonCubit>().execute(
                  useCase: getIt<SignUpUseCase>(),
                  params: userCreationReq,
                );
              },
              title: 'Finish',
            );
          },
        ),
      ),
    );
  }
}
