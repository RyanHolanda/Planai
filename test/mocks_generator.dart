import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:planai/repository/workout_repository.dart';

@GenerateMocks([WorkoutRepository, Dio, RequestOptions])
class MocksClass {}
