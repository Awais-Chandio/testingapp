import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import '../repositories/auth_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  // Configure Dio
  final dio = Dio(BaseOptions(
    baseUrl: 'http://softkhata.store',
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Content-Type': 'application/json',
    },
  ));

  
  getIt.registerSingleton<Dio>(dio);
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepository(dio));
}
