import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/core/api/provider/request_api_provider.dart';
import 'package:myapp/core/client/client.dart';
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
   // Repository
  injection.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(injection()),
  );


  injection.registerLazySingleton<LoginUser>(() => LoginUserImpl(injection()));

 
  // Data sources
  injection.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(client: injection()),
  );

  

  final sharedPreferences = await SharedPreferences.getInstance();
  injection.registerLazySingleton(() => sharedPreferences);
  injection.registerLazySingleton(() => Client());
  injection.registerLazySingleton(() => RequestApiProvider(injection()));
}
