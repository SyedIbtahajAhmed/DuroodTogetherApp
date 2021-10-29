import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:durood_together_app/Core/Providers/DuroodCountProvider/durood-count-provider.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => DuroodCountVM());
  locator.registerLazySingleton(() => DuroodCountProvider());
  // locator.registerLazySingleton(() => CRUDModel());
}
