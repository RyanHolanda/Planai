part of 'create_workout_modal_cubit.dart';

@freezed
class CreateWorkoutModalState with _$CreateWorkoutModalState {
  const factory CreateWorkoutModalState.initial() = _Initial;
  const factory CreateWorkoutModalState.loading() = _Loading;
  const factory CreateWorkoutModalState.error() = _Error;
  const factory CreateWorkoutModalState.success(WorkoutPlanDto workoutPlan) = _Success;
}
