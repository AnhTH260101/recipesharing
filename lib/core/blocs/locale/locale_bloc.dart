import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../services/shared_preference.dart';

part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc(this._shared)
      : super(LocaleState(locale: Locale(_shared.getLocale()),
  )) {
    on<ChangeLocaleEvent>(_changeLocaleHandler);
  }

  final SharedPreference _shared;

  Future<void> _changeLocaleHandler(
      ChangeLocaleEvent event,
      Emitter<LocaleState> emit,
      ) async {
    emit(LocaleState(locale: event.locale));
    await _shared.setLocale(event.locale.languageCode);
  }
}
