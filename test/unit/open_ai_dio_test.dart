import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:planai/core/inject.dart';

void main() async {
  late Dio dio;

  setUpAll(() async {
    await setupInjection();
    await dotenv.load(fileName: '.env');
    dio = inject<Dio>(instanceName: InjectConstants.openAiDioInstanceName);
  });

  test("Ensure dio is using the open ai API Key", () async {
    expect(dio.options.headers['Authorization'].contains("${dotenv.env["OPEN_AI_API_KEY"]}"), true);
  });
}
