part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitialState extends SplashState {
  const SplashInitialState();
}

class SplashLoadedState extends SplashState {
  const SplashLoadedState();
}

