import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/favourite_tab/favourite_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/home_screen_tab/home_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_screen_tab.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/profile_tab/profile_screen_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = getIt<HomeScreenViewModel>();

  final List<Widget> tabs = [
    const HomeScreenTab(),
    const ProductScreenTab(),
    const FavouriteScreenTab(),
    const ProfileScreenTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel , HomeScreenStates>(
      bloc: viewModel,
      builder: (context, state) {
        return  Scaffold(
          backgroundColor: Colors.white,

          appBar: _buildAppBar(),

          body: tabs[viewModel.selectedIndex],

          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                onTap: (index) {
                  setState(() {
                    viewModel.bottomNavOnTab(index);
                  });
                },
                currentIndex: viewModel.selectedIndex,
                iconSize: 24.sp,
                items: [
                  _bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 0,
                    selectedIcon: AppAssets.selectedHomeIcon,
                    unselectedIcon: AppAssets.unselectedHomeIcon,
                  ),

                  _bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 1,
                    selectedIcon: AppAssets.selectedProductIcon,
                    unselectedIcon: AppAssets.unselectedProductIcon,
                  ),

                  _bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 2,
                    selectedIcon: AppAssets.selectedFavouriteIcon,
                    unselectedIcon: AppAssets.unselectedFavouriteIcon,
                  ),

                  _bottomNavigationBarItemBuilder(
                    isSelected: viewModel.selectedIndex == 3,
                    selectedIcon: AppAssets.selectedProfileIcon,
                    unselectedIcon: AppAssets.unselectedProfileIcon,
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }





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
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16.h),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'what do you search for?',
                          hintStyle: TextStyle(
                            color: const Color(0xFFA3A3A3),
                            fontSize: 14.sp,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                            size: 24.sp,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),

                    InkWell(
                      onTap: () {},
                      child: ImageIcon(
                        const AssetImage(AppAssets.cartIcon),
                        color: AppColors.primaryColor,
                        size: 24.sp,
                      ),
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


  BottomNavigationBarItem _bottomNavigationBarItemBuilder({
    required bool isSelected,
    required String selectedIcon,
    required String unselectedIcon,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        foregroundColor: isSelected
            ? AppColors.primaryColor
            : AppColors.whiteColor,
        backgroundColor: isSelected ? AppColors.whiteColor : Colors.transparent,
        radius: 25.r,
        child: Image.asset(isSelected ? selectedIcon : unselectedIcon),
      ),
      label: "",
    );
  }
}
