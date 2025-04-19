part of 'bottom_navigation_bar_cubit.dart';

@immutable
sealed class BottomNavigationBarState {}

final class BottomNavigationBarHome extends BottomNavigationBarState {}
final class BottomNavigationBarTiket extends BottomNavigationBarState {}
final class BottomNavigationBarProfile extends BottomNavigationBarState {}
