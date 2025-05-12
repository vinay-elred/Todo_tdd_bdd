import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([proerties]);
  final List properties = const [];

  @override
  List<Object?> get props => properties;
}

final class CacheFailure extends Failure {}
