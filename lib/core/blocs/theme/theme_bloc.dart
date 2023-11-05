import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipesharing/core/enums/enums.dart';
import 'package:recipesharing/core/services/shared_preference.dart';
import 'package:recipesharing/core/theme/theme.dart' as theme;

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc(this._sharedPreference)
      : super(ThemeState(
          themeData: _sharedPreference.getTheme() == EnumTheme.light.name
              ? theme.Theme.lightTheme
              : theme.Theme.darkTheme,
        )) {
    on<ChangeThemeEvent>(_changeThemeHandler);
  }

  final SharedPreference _sharedPreference;

  Future<void> _changeThemeHandler(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ThemeState(
      themeData: event.theme == EnumTheme.light.name
          ? theme.Theme.lightTheme
          : theme.Theme.darkTheme,
    ));
    await _sharedPreference.setTheme(event.theme);
  }
}
