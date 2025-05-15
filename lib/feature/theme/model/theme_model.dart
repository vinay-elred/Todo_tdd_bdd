import 'package:equatable/equatable.dart';

class ThemeModel extends Equatable {
  const ThemeModel(this.theme);
  final Theme theme;

  @override
  List<Object?> get props => [theme];

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(Theme.light);
  }

  Map<String, dynamic> toMap() {
    throw UnimplementedError();
  }
}

enum Theme { light, dark, system }
