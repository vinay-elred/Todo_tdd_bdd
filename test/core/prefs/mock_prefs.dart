import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([Prefs])
class Prefs extends Mock implements SharedPreferences {}
