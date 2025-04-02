part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

final class LoadLanguage extends LanguageEvent {
  const LoadLanguage();
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.locale});
  final Locale locale;

  @override
  // TODO: implement props
  List<Object> get props => [locale];
}
