import 'package:injectable/injectable.dart';
import 'package:todo_app/core/exception.dart';
import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:dartz/dartz.dart';

import 'data_source/todo_local_data_source.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> fetch();
  Future<Either<Failure, Unit>> add(TodoModel todo);
}

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  const TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> add(TodoModel todo) async {
    try {
      final success = await localDataSource.add(todo);
      if (!success) throw CacheException();
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> fetch() async {
    try {
      final todos = await localDataSource.fetch();
      return Right(todos);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
