import 'package:dartz/dartz.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';

import 'data_source/theme_local_data_source.dart';

abstract class ThemeRepository {
  Future<Either<Failure, ThemeModel>> getTheme();
  Future<Either<Failure, Unit>> setTheme(ThemeModel theme);
}

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource themeLocalDataSource;
  const ThemeRepositoryImpl({required this.themeLocalDataSource});

  @override
  Future<Either<Failure, ThemeModel>> getTheme() async {
    try {
      final theme = await themeLocalDataSource.getTheme();
      return Right(theme);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> setTheme(ThemeModel theme) {
    // TODO: implement setTheme
    throw UnimplementedError();
  }
}
