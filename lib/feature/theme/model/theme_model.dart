import 'package:equatable/equatable.dart';

class ThemeModel extends Equatable {
  const ThemeModel(this.theme);
  final Themes theme;

  @override
  List<Object?> get props => [theme];

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    final themeString = json["theme"];
    return ThemeModel(Themes.fromString(themeString));
  }

  Map<String, dynamic> toMap() {
    return {"theme": theme.name};
  }
}

enum Themes {
  light,
  dark,
  system;

  factory Themes.fromString(String? theme) {
    if (theme == Themes.light.name) return Themes.light;
    if (theme == Themes.dark.name) return Themes.dark;
    return Themes.system;
  }
}
