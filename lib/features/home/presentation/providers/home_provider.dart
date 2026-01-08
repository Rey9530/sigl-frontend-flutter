import 'package:flutter_riverpod/flutter_riverpod.dart';

// Home State
class HomeState {
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

// Home State Notifier
class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? message) {
    state = state.copyWith(errorMessage: message);
  }

  void clearError() {
    state = state.copyWith(errorMessage: null);
  }
}

// Home State Provider
final homeStateProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
