import 'package:get_it/get_it.dart';
import 'package:small_deals/auth/data/repositories/auth_repository.dart';
import 'package:small_deals/auth/logic/auth_provider.dart';

final getIt = GetIt.instance;

setupLocator() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(),
  );

  getIt.registerLazySingleton(
    () => AuthProvider(
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
}
