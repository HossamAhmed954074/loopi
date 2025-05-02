import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarHome());

 void changeItem(int value){
   if(value == 0){
     emit(BottomNavigationBarHome());
   }else if(value == 1){
     emit(BottomNavigationBarProfile());
   }
 }
}
