import 'package:dartz/dartz.dart';
import '/core/core.dart';

abstract class UseCase<Type, Params> {
  Future<Type> execute(Params params);
}


/// Class to handle when useCase don't need params
class NoParams {}