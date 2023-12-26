import 'package:get_it/get_it.dart';
import '../chat/chat_repository.dart';
import '../http-service/http-service.dart';
import '../signup/login_repository.dart';


GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
  locator.registerLazySingleton<ChatRepository>(() => ChatRepository());
  // locator.registerLazySingleton<TruckRepository>(() => TruckRepository());
  // locator.registerLazySingleton<HomeRepository>(() => HomeRepository());
  // locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  // locator.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
  // locator.registerLazySingleton<ServiceRepository>(() => ServiceRepository());


}