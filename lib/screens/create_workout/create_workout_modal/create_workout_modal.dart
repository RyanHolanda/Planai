import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/inject.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/gen/assets.gen.dart';
import 'package:planai/repository/workout_repository.dart';
import 'package:planai/screens/create_workout/create_workout_modal/cubit/create_workout_modal_cubit.dart';
import 'package:planai/screens/created_workout_overview/created_workout_overview_screen.dart';
import 'package:planai/widgets/custom_button.dart';
import 'package:planai/widgets/custom_error_state.dart';

class CreateWorkoutModal extends StatefulWidget {
  const CreateWorkoutModal({super.key, required this.userInfo});

  final UserInfoDto userInfo;

  void show(BuildContext context) => showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) => BlocProvider(
          create: (context) => CreateWorkoutModalCubit(inject<WorkoutRepository>()),
          child: CreateWorkoutModal(userInfo: userInfo),
        ),
        showDragHandle: false,
        enableDrag: false,
      );

  @override
  State<CreateWorkoutModal> createState() => _CreateWorkoutModalState();
}

class _CreateWorkoutModalState extends State<CreateWorkoutModal> with TickerProviderStateMixin {
  late final AnimationController _loadingController;
  late final PageController _pageController;

  bool? isGymWorkout;
  CreateWorkoutModalCubit get _cubit => context.read<CreateWorkoutModalCubit>();
  Timer? loadingIconsCarouselTimer;

  Future<void> initIconsCarousel() async {
    if (_pageController.positions.isEmpty) return;
    if (_pageController.page == (Assets.loadingPack.values.length.toDouble() - 1)) {
      if (mounted) _pageController.animateToPage(0, curve: Curves.decelerate, duration: const Duration(milliseconds: 300));
    } else {
      if (mounted) _pageController.nextPage(curve: Curves.decelerate, duration: const Duration(milliseconds: 900));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _pageController = PageController();
  }

  @override
  void dispose() {
    loadingIconsCarouselTimer?.cancel();
    _pageController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateWorkoutModalCubit, CreateWorkoutModalState>(
      listener: (context, state) {
        state.whenOrNull(
            success: (workoutPlan) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CreatedWorkoutOverview(workoutPlan: workoutPlan)),
                  (route) => false,
                ),
            loading: () {
              _loadingController.forward();
              loadingIconsCarouselTimer = Timer.periodic(const Duration(seconds: 4), (_) {
                initIconsCarousel();
              });
            });
      },
      builder: (context, state) {
        return SafeArea(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 900),
            curve: Curves.fastOutSlowIn,
            height: state.maybeWhen(orElse: () => 330, loading: () => 300, error: () => 360),
            child: state.maybeWhen(
              orElse: () => chooseLocation(context)
                  .animate(autoPlay: false, controller: _loadingController)
                  .fadeOut(delay: const Duration(milliseconds: 100), duration: const Duration(milliseconds: 400))
                  .swap(builder: (context, child) => loading()),
              error: () => Builder(builder: (context) {
                return Wrap(
                  children: [
                    Padding(padding: const EdgeInsets.all(8).copyWith(bottom: 0), child: const Align(alignment: Alignment.topRight, child: CloseButton())),
                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: CustomErrorState(
                        errorDescription: S.of(context)!.createWorkoutModalErrorDescription,
                        onTryAgain: () => _cubit.createWorkout(context, userInfo: widget.userInfo, isGymWorkout: isGymWorkout!),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }

  WillPopScope loading() {
    return WillPopScope(
      onWillPop: () async => false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 25),
          Text(
            isGymWorkout ?? false ? S.of(context)!.createWorkoutModalWorkoutPlanWithGym : S.of(context)!.createWorkoutModalWorkoutPlanWithoutGym,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
          ),
          Text(widget.userInfo.focus.label(context), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: widget.userInfo.focus.color, fontWeight: FontWeight.w600)),
          const SizedBox(height: 40),
          Expanded(
              child: Stack(
            children: [
              PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: List.generate(
                  Assets.loadingPack.values.length,
                  (index) => Center(
                    child: Assets.loadingPack.values[index]
                        .image(height: 80)
                        .animate(onComplete: (controller) async => await controller.repeat(period: const Duration(seconds: 4), reverse: true))
                        .untint()
                        .shimmer()
                        .fadeIn()
                        .move(),
                  ),
                ),
              ),
            ],
          )),
          const SizedBox(height: 20),
          Text(S.of(context)!.createWorkoutModalCreatingYourWorkoutPlan, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 5),
          Text(S.of(context)!.createWorkoutModalPleaseDoNotCloseTheApp, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.error)),
          const SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget chooseLocation(BuildContext context) {
    return Wrap(
      children: [
        Stack(
          children: [
            const Padding(padding: EdgeInsets.all(8), child: Align(alignment: Alignment.topRight, child: CloseButton())),
            Padding(
              padding: const EdgeInsets.only(top: 42),
              child: SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(text: " ${S.of(context)!.workoutLocationModalTitle} "),
                            TextSpan(
                              text: "${widget.userInfo.focus.label(context)}?",
                              style: TextStyle(color: widget.userInfo.focus.color),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      RadioListTile<bool?>(
                        key: const Key("gym"),
                        value: isGymWorkout,
                        fillColor: MaterialStatePropertyAll(widget.userInfo.focus.color),
                        groupValue: true,
                        onChanged: (value) {
                          setState(() {
                            isGymWorkout = true;
                          });
                        },
                        title: Text(S.of(context)!.workoutLocationModalYes, style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      const SizedBox(height: 5),
                      RadioListTile<bool?>(
                        key: const Key("no-gym"),
                        fillColor: MaterialStatePropertyAll(widget.userInfo.focus.color),
                        value: isGymWorkout,
                        groupValue: false,
                        onChanged: (value) {
                          setState(() {
                            isGymWorkout = false;
                          });
                        },
                        title: Text(S.of(context)!.workoutLocationModalNo, style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        key: const Key("create-workout"),
                        height: 50,
                        title: Text(S.of(context)!.createWorkoutModalCreateMyWorkoutPlan, style: const TextStyle(color: Colors.white)),
                        onPressed: isGymWorkout != null ? () => _cubit.createWorkout(context, userInfo: widget.userInfo, isGymWorkout: isGymWorkout!) : null,
                        color: widget.userInfo.focus.color,
                        disabledColor: widget.userInfo.focus.color.withOpacity(0.3),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
