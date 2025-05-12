import 'dart:io';

Future<String> loadFixture(String name) async {
  return await File("test/fixture/$name").readAsString();
}
