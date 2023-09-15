import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:planai/core/ai_prompt.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/dto/workout_plan_dto.dart';
import 'package:planai/repository/workout_repository.dart';

part 'create_workout_modal_cubit.freezed.dart';
part 'create_workout_modal_state.dart';

class CreateWorkoutModalCubit extends Cubit<CreateWorkoutModalState> {
  CreateWorkoutModalCubit(this._repository) : super(const CreateWorkoutModalState.initial());

  final WorkoutRepository _repository;

  void createWorkout(BuildContext context, {required UserInfoDto userInfo, required bool isGymWorkout}) async {
    try {
      emit(const CreateWorkoutModalState.loading());

      final workoutPlan = await _repository.createWorkout(
        userInfo: userInfo.copyWith(workoutAtGym: isGymWorkout),
        prompt: AIPrompt(userInfo: userInfo).getWorkoutPlanPrompt(S.of(context)!.localeName),
      );

      emit(CreateWorkoutModalState.success(workoutPlan));
    } catch (e) {
      emit(const CreateWorkoutModalState.error());
    }
  }
}
