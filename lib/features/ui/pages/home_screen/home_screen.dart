import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/favourite_tab/favourite_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/home_screen_tab/home_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/profile_tab/profile_screen_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/custom_badget.dart';
import '../cart_screen/cubit/cart_states.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    CartScreenViewModel.get(context).getItemsCart();
  }

  final List<Widget> tabs = const [
    HomeScreenTab(),
    ProductScreenTab(),
    FavouriteScreenTab(),
    ProfileTabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,

          appBar: viewModel.selectedIndex == 3 ? null : _buildAppBar(),

          body: tabs[viewModel.selectedIndex],

          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColors.primaryColor,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: viewModel.selectedIndex,
                onTap: (index) {
                  setState(() {
                    viewModel.bottomNavOnTab(index);
                  });
                },
                iconSize: 24.sp,
                items: [
                  _item(0, AppAssets.selectedHomeIcon, AppAssets.unselectedHomeIcon),
                  _item(1, AppAssets.selectedProductIcon, AppAssets.unselectedProductIcon),
                  _item(2, AppAssets.selectedFavouriteIcon, AppAssets.unselectedFavouriteIcon),
                  _item(3, AppAssets.selectedProfileIcon, AppAssets.unselectedProfileIcon),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ---------------- APP BAR ----------------

  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(130.h),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.logoIcon,
                  height: 24.h,
                ),

                SizedBox(height: 16.h),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'What do you search for?',
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 16.w),

                    // ✅ FIX: Live Badge Update
                    BlocBuilder<CartScreenViewModel, CartStates>(
                      builder: (context, state) {
                        return CustomBadge(
                          count: CartScreenViewModel.get(context).numOfCartItems,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.cartScreen,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAV ITEM ----------------

  BottomNavigationBarItem _item(
      int index,
      String selected,
      String unselected,
      ) {
    final isSelected = viewModel.selectedIndex == index;

    return BottomNavigationBarItem(
      icon: CircleAvatar(
        backgroundColor:
        isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(
          isSelected ? selected : unselected,
        ),
      ),
      label: "",
    );
  }
}