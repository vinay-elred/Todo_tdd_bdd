import 'package:todo_app/core/failure.dart';
import 'package:todo_app/feature/todo/model/todo_model.dart';
import 'package:dartz/dartz.dart';

import 'data_source/todo_local_data_source.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> fetch();
  Future<Either<Failure, Unit>> add(TodoModel todo);
}

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;
  const TodoRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> add(TodoModel todo) async {
    final success = await localDataSource.add(todo);
    return Right(unit);
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
