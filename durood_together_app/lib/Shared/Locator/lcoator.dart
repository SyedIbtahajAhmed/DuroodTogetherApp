import 'package:durood_together_app/Core/DataServices/API/generic_api.dart';
import 'package:durood_together_app/Core/DataViewModels/CrudModel/CRUD-Model.dart';
import 'package:durood_together_app/Core/DataViewModels/DuroodCountModel/duroodCountVM.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => DuroodCountVM());
  locator.registerLazySingleton(() => CRUDModel());
}
