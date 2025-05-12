import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/feature/todo/repository/todo_repository.dart';

@GenerateMocks([TodoRepo])
class TodoRepo extends Mock implements TodoRepository {}
