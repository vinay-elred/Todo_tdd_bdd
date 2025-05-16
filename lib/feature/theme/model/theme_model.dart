import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

  ThemeMode toThemeMode() {
    if (theme == Themes.dark) return ThemeMode.dark;
    if (theme == Themes.light) return ThemeMode.light;
    return ThemeMode.system;
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
