import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:planai/repository/workout_repository.dart';

abstract class InjectConstants {
  static const openAiDioInstanceName = 'open_ai';
}

final inject = GetIt.instance;

Future<void> setupInjection() async {
  await inject.reset();

  inject.registerLazySingleton<Dio>(
    () {
      final dio = Dio()
        ..interceptors.addAll([
          LogInterceptor(requestHeader: true, responseHeader: false, error: true, responseBody: true),
        ]);

      dio.options.baseUrl = 'https://api.openai.com/v1';
      dio.options.headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['OPEN_AI_API_KEY']}',
      };

      return dio;
    },
    instanceName: InjectConstants.openAiDioInstanceName,
  );

  inject.registerLazySingleton<WorkoutRepository>(() => WorkoutRepository(inject<Dio>(instanceName: InjectConstants.openAiDioInstanceName)));

  return inject.allReady();
}
