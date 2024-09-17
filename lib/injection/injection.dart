import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/injection/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDepencies() async => await getIt.init();