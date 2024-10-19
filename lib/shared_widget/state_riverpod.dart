import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OnboardingStep { signUp, completeProfile, whatGoal, welcome }

class OnboardingNotifier extends StateNotifier<OnboardingStep> {
  OnboardingNotifier() : super(OnboardingStep.signUp);

  void completeSignUp() {
    state = OnboardingStep.completeProfile;
  }

  void completeProfile() {
    state = OnboardingStep.whatGoal;
  }

  void completeWhatGoal() {
    state = OnboardingStep.welcome;
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, OnboardingStep>(
  (ref) => OnboardingNotifier(),
);
