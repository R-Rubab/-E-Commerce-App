import 'package:ecommerce_app/common/bloc/button/button_state.dart';
import 'package:ecommerce_app/common/bloc/button/button_state_cubit.dart';
import 'package:ecommerce_app/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:ecommerce_app/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce_app/core/configs/theme/app_colors.dart';
import 'package:ecommerce_app/data/auth/models/user_creation_req.dart';
import 'package:ecommerce_app/domain/auth/usecases/siginup.dart';
import 'package:ecommerce_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:ecommerce_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:ecommerce_app/presentation/auth/pages/siginin.dart';
import 'package:ecommerce_app/presentation/auth/widgets/ages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/appbar/app_bar.dart';
import '../../../common/widgets/button/basic_reactive_button.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({required this.userCreationReq, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit())
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(
                content: Text(state.errorMessage),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tellUs(),
                    SizedBox(height: 30.h),
                    _genders(context),
                    SizedBox(height: 30.h),
                    howOld(),
                    const SizedBox(
                      height: 30,
                    ),
                    _age(),
                  ],
                ),
              ),
              const Spacer(),
              _finishButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _tellUs() {
    return Text(
      'Tell us about yourself',
      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          genderTile(context, 1, 'Men'),
          SizedBox(width: 20.w),
          genderTile(context, 2, 'Women'),
        ],
      );
    });
  }

  Expanded genderTile(BuildContext context, int genderIndex, String gender) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          context.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60.h,
          decoration: BoxDecoration(
              color: context.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? AppColors.primary
                  : AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30.r)),
          child: Center(
            child: Text(
              gender,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }

  Widget howOld() {
    return Text(
      'How old are you?',
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
    );
  }

  Widget _age() {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
              context,
              MultiBlocProvider(providers: [
                BlocProvider.value(
                  value: context.read<AgeSelectionCubit>(),
                ),
                BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges())
              ], child: const Ages()));
        },
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
          ),
        ),
      );
    });
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100.h,
      color: AppColors.secondBackground,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Center(
        child: Builder(builder: (context) {
          return BasicReactiveButton(
              onPressed: () {
                userCreationReq.gender =
                    context.read<GenderSelectionCubit>().selectedIndex;
                userCreationReq.age =
                    context.read<AgeSelectionCubit>().selectedAge;
                context
                    .read<ButtonStateCubit>()
                    .execute(useCase: SignUpUseCase(), params: userCreationReq)
                    .then(AppNavigator.pushReplacement(context, SignInPage()));
              },
              title: 'Finish');
        }),
      ),
    );
  }
}
