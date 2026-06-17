import 'package:e_commerece_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../tabs/favourite_tab/favourite_screen_tab.dart';
import '../tabs/home_screen_tab/home_screen_tab.dart';
import '../tabs/product_tab/product_screen_tab.dart';
import '../tabs/profile_tab/profile_screen_tab.dart';


@injectable
class HomeScreenViewModel extends Cubit<HomeScreenStates>{

  HomeScreenViewModel():super(HomeScreenInitialState());

  // todo : hold data - handle logic

  int selectedIndex = 0;
  List<Widget> bodyList = [

    HomeScreenTab(),
    ProductScreenTab(),
    FavouriteScreenTab(),
    ProfileTabScreen()

  ];

  void bottomNavOnTab(int index){
    selectedIndex = index ;
    emit(ChangeSelectedIndexlState());
  }

}