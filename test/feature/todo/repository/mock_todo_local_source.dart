import 'package:todo_app/feature/todo/repository/data_source/todo_local_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([TodoLocalSource])
class TodoLocalSource extends Mock implements TodoLocalDataSource {}
