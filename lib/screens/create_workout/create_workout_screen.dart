import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/height_input_formatter.dart';
import 'package:planai/core/weight_input_formatter.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/screens/create_workout/create_workout_age_step.dart';
import 'package:planai/screens/create_workout/create_workout_focus_step.dart';
import 'package:planai/screens/create_workout/create_workout_height_step.dart';
import 'package:planai/screens/create_workout/create_workout_modal/create_workout_modal.dart';
import 'package:planai/screens/create_workout/create_workout_weight_step.dart';

class CreateWorkoutScreen extends StatefulWidget {
  const CreateWorkoutScreen({super.key});

  @override
  State<CreateWorkoutScreen> createState() => _CreateWorkoutScreenState();
}

class _CreateWorkoutScreenState extends State<CreateWorkoutScreen> {
  int _pageIndex = 0;
  num? userHeight;
  num? userWeight;
  num? userAge;
  UserFocus? userFocus;
  HeightType? userHeightType;
  WeightType? userWeightType;

  final PageController _pageController = PageController();

  void nextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex < 1) {
          return true;
        } else {
          previousPage();
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            leadingWidth: 55,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  if (Navigator.canPop(context) && _pageIndex < 1) {
                    Navigator.pop(context);
                  } else {
                    previousPage();
                  }
                },
                icon: const Icon(Icons.navigate_before, size: 30)),
            title: Text(
              S.of(context)!.createWorkoutScreenCreateWorkoutPlan,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).hintColor),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(14),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: stepCounter(context),
                ))
            // : null,
            ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) => setState(() => _pageIndex = value),
                children: [
                  CreateWorkoutHeightStep(
                    heightType: userHeightType,
                    height: userHeight,
                    onChanged: (height) => userHeight = height,
                    onContinue: (type) {
                      userHeightType = type;
                      nextPage();
                    },
                  ),
                  CreateWorkoutWeightStep(
                    weightType: userWeightType,
                    weight: userWeight,
                    onChanged: (weight) => userWeight = weight,
                    onContinue: (type) {
                      userWeightType = type;
                      nextPage();
                    },
                  ),
                  CreateWorkoutAgeStep(age: userAge, onChanged: (age) => userAge = age, onContinue: () => nextPage()),
                  CreateWorkoutFocusStep(
                    onSelected: (focus) {
                      userFocus = focus;
                      CreateWorkoutModal(
                        userInfo: UserInfoDto(
                          age: userAge ?? 0,
                          focus: focus,
                          height: userHeight ?? 0,
                          weight: userWeight ?? 0,
                          weightType: userWeightType ?? WeightType.unknown,
                          heightType: userHeightType ?? HeightType.unknown,
                        ),
                      ).show(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align stepCounter(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: SizedBox(
              height: 8,
              width: 8,
              child: CircleAvatar(
                backgroundColor: index == _pageIndex ? Theme.of(context).colorScheme.primary : Theme.of(context).hintColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
