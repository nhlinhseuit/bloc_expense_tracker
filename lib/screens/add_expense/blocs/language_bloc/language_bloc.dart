import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:bloc_expenses_tracker/utils/utils.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(locale: Locale('vi'))) {
    on<LoadLanguage>(_onLoadLanguage);
    on<ChangeLanguage>(_onChangeLanguage);
  }

  _onLoadLanguage(LoadLanguage event, Emitter<LanguageState> emit) async {
    try {
      final Locale locale = await Utils().getLocale();
      emit(LanguageState(locale: locale));
    } catch (e) {
      emit(const LanguageState(locale: Locale('en')));
    }
  }

  _onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    emit(LanguageState(locale: event.locale));
    Utils().changeLocale();
  }
}
