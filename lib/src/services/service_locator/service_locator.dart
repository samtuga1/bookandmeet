import 'package:bookandmeet/src/data/data.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<ThemeController>(ThemeController());
}
