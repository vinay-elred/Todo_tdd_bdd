import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/core/toast_hepler.dart';
import 'package:todo_app/feature/theme/model/theme_model.dart';
import 'package:todo_app/feature/theme/repository/theme_repository.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeRepository themeRepository;
  final ToastHelper toastHelper;
  ThemeViewModel({required this.themeRepository, required this.toastHelper});

  final StreamController<ThemeMode> _streamController = StreamController();

  Stream<ThemeMode> get themeStream => _streamController.stream;

  Future<void> getTheme() async {
    final response = await themeRepository.getTheme();
    response.fold(
      (failure) {
        _streamController.add(ThemeMode.system);
      },
      (themeModel) {
        _streamController.add(themeModel.toThemeMode());
      },
    );
  }

  Future<void> changeTheme(ThemeModel theme) async {
    final response = await themeRepository.setTheme(theme);
    response.fold(
      (failure) {
        toastHelper.show("Failed to set Theme!");
      },
      (unit) {
        _streamController.add(theme.toThemeMode());
      },
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
