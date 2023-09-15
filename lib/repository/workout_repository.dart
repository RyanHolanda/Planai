import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/dto/workout_plan_dto.dart';

class WorkoutRepository {
  WorkoutRepository(this._dio);

  final Dio _dio;

  Future<WorkoutPlanDto> createWorkout({required UserInfoDto userInfo, required String prompt}) async {
    final response = await _dio.post('/chat/completions', data: {
      'model': 'gpt-3.5-turbo-16k',
      "messages": [
        {
          "role": "system",
          "content": prompt,
        }
      ],
      "temperature": 0.7
    });

    final data = WorkoutPlanDto.fromJson(json.decode(response.data['choices'][0]['message']['content']));
    return data;
  }
}
