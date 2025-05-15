import 'package:equatable/equatable.dart';

class ThemeModel extends Equatable {
  const ThemeModel(this.theme);
  final Theme theme;

  @override
  List<Object?> get props => [theme];

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    final themeString = json["theme"];
    return ThemeModel(Theme.fromString(themeString));
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

enum Theme {
  light,
  dark,
  system;

  factory Theme.fromString(String? theme) {
    if (theme == Theme.light.name) return Theme.light;
    if (theme == Theme.dark.name) return Theme.dark;
    return Theme.system;
  }
}
