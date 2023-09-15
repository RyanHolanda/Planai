import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planai/dto/user_info_dto.dart';
import 'package:planai/dto/workout_plan_dto.dart';
import 'package:planai/repository/workout_repository.dart';

import '../mocks_generator.mocks.dart';

void main() {
  late final Dio dio;
  late final WorkoutRepository sut;

  final userInfo = UserInfoDto.fixture();

  setUp(() {
    dio = MockDio();
    sut = WorkoutRepository(dio);
  });

  test("When call create workout, should return the created workout in ${WorkoutPlanDto.workoutplanJsonSample} format", () async {
    when(dio.post("/chat/completions", data: anyNamed("data"))).thenAnswer(
      (_) async => Response(
        requestOptions: MockRequestOptions(),
        data: {
          'choices': [
            {
              "message": {"content": "{}"}
            }
          ]
        },
      ),
    );

    await sut.createWorkout(userInfo: userInfo, prompt: "test");

    verify(dio.post("/chat/completions",
            data: {
              'model': 'gpt-3.5-turbo-16k',
              "messages": [
                {
                  "role": "system",
                  "content": "test",
                }
              ],
              "temperature": 0.7
            },
            options: anyNamed("options")))
        .called(1);
  });
}
