import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/api/provider/request_api_provider.dart';
import 'package:myapp/core/client/client.dart';
import 'package:myapp/features/account_management/data/datasources/account_managemen_datasource.dart';
import 'package:myapp/features/account_management/data/repositories/account_management_repository_impl.dart';
import 'package:myapp/features/account_management/domain/repositories/account_management_repository.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_balance.dart';
import 'package:myapp/features/account_management/domain/usecases/get_user_statements.dart';
import 'package:myapp/features/account_management/presentation/store/home_controller.dart';
import 'package:myapp/features/login/data/datasources/login_datasource.dart';
import 'package:myapp/features/login/data/repositories/login_repository_impl.dart';
import 'package:myapp/features/login/domain/repositories/login_repository.dart';
import 'package:myapp/features/login/domain/usecases/login_user.dart';
import 'package:myapp/features/login/presentation/store/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injection = GetIt.instance;

Future<void> init() async {
  injection.registerFactory(
    () => LoginController(injection()),
  );
  injection.registerFactory(
    () => HomeController(injection(), injection()),
  );
  injection.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(injection()),
  );
  injection.registerLazySingleton<LoginUser>(() => LoginUserImpl(injection()));

  injection.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(client: injection()),
  );

  injection.registerLazySingleton<AccountManagementRepository>(
    () => AccountManagementImpl(injection()),
  );

  injection.registerLazySingleton<GetUserBalance>(
      () => GetUserBalanceImpl(injection()));

  injection.registerLazySingleton<GetUserStatements>(
      () => GetUserStatementsImpl(injection()));

  injection.registerLazySingleton<AccountManagementDataSource>(
    () => AccountManagementDataSourceImpl(client: injection()),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  injection.registerLazySingleton(() => sharedPreferences);
  injection.registerLazySingleton(() => Client());
  injection.registerLazySingleton(() => RequestApiProvider(injection()));
}
