import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:planai/core/enums/user_focus_enum.dart';
import 'package:planai/core/extensions/duration_extension.dart';
import 'package:planai/dto/workout_plan_dto.dart';

class CreatedWorkoutOverview extends StatelessWidget {
  CreatedWorkoutOverview({super.key, required this.workoutPlan});

  final WorkoutPlanDto workoutPlan;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: ClipRect(
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
            blendMode: BlendMode.srcIn,
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              scrolledUnderElevation: 10,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.white,
              title: Text(workoutPlan.title, style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, color: Theme.of(context).hintColor)),
            ),
          ),
        ),
      ),
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      S.of(context)!.createdWorkoutOverviewScreenWorkout(workoutPlan.focus?.label(context) ?? ""),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: workoutPlan.focus?.color, fontWeight: FontWeight.w600),
                    ),
                    ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: workoutPlan.workouts.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).shadowColor,
                            spreadRadius: 1,
                            blurRadius: 13,
                          ),
                        ]),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Day ${workoutPlan.workouts[index].day} - ${workoutPlan.workouts[index].name}',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500, color: workoutPlan.focus?.color.withOpacity(0.7))),
                            if (workoutPlan.workouts[index].exercises.isNotEmpty) ...[
                              const SizedBox(height: 15),
                              ...List.generate(
                                workoutPlan.workouts[index].exercises.length,
                                (listGenerateIndex) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "• ${workoutPlan.workouts[index].exercises[listGenerateIndex].name}",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        style: Theme.of(context).textTheme.bodyMedium,
                                        children: [
                                          if (workoutPlan.workouts[index].exercises[listGenerateIndex].sets != 0)
                                            TextSpan(
                                              text: "${workoutPlan.workouts[index].exercises[listGenerateIndex].sets} ${S.of(context)!.createdWorkoutOverviewScreenSets}",
                                            ),
                                          if (workoutPlan.workouts[index].exercises[listGenerateIndex].reps != 0)
                                            TextSpan(
                                              text: " • ${workoutPlan.workouts[index].exercises[listGenerateIndex].reps} ${S.of(context)!.createdWorkoutOverviewScreenReps}",
                                            ),
                                          if (workoutPlan.workouts[index].exercises[listGenerateIndex].duration != 0)
                                            TextSpan(
                                              text: "• ${Duration(seconds: workoutPlan.workouts[index].exercises[listGenerateIndex].duration.toInt()).formatDuration(context)}",
                                            ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    if (workoutPlan.workouts[index].exercises[listGenerateIndex].restDuration != 0)
                                      Text(
                                        "${S.of(context)!.createdWorkoutOverviewScreenRest} ${Duration(seconds: workoutPlan.workouts[index].exercises[listGenerateIndex].restDuration.toInt()).formatDuration(context)}",
                                        style: Theme.of(context).textTheme.bodyMedium,
                                      ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
