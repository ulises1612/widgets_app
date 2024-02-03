
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';


//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

//un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//un simple int
final selectedColorProvider = StateProvider((ref) => 0);


//un objeto de tipo AppThem (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
);


//controller o notifier
class ThemeNotifier extends StateNotifier<AppTheme>{

  ThemeNotifier(): super(AppTheme());

  void toggleDarkMode(){

    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex( int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }

}