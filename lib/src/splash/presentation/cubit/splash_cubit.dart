import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitialState());

  void loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const SplashLoadedState());
  }
}