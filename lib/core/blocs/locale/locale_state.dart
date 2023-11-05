part of 'locale_bloc.dart';

class LocaleState extends Equatable {
  const LocaleState({required this.locale});
  final Locale locale;

  @override
  List<Object> get props => [locale];
}
