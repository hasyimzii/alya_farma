part of 'navigation_cubit.dart';

class NavigationState extends Equatable {
  const NavigationState({
    required this.currentIndex,
    required this.currentScreen,
  });

  final int currentIndex;
  final Widget currentScreen;

  @override
  List<Object> get props => [currentIndex, currentScreen];
}
