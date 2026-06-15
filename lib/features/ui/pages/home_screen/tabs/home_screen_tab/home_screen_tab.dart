import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/core/widget/main_error_widget.dart';
import 'package:e_commerece_app/core/widget/main_loading_state.dart';
import 'package:e_commerece_app/domain/entities/response/common/category_or_brand.dart';
import 'package:e_commerece_app/features/ui/pages/category_brand_item/category_brand_items.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/home_screen_tab/cubit/home_tab_states.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/home_screen_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenTab extends StatefulWidget {

  const HomeScreenTab({super.key});

  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getAllCategories();
    viewModel.getAllBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),

            _buildAnnouncement(images: [
              AppAssets.announcement1,
              AppAssets.announcement2
            ]),
            SizedBox(
              height: 24.h,
            ),
            _lineBreak(name: "Categories"),
            BlocBuilder<HomeTabViewModel , HomeTabStates>(
              bloc: viewModel,
                builder: (context, state) {

                if(state is CategoryErrorState){
                  return MainErrorWidget(errorMessage: state.errorMessage, onPressed: () {
                    viewModel.getAllCategories();
                  },);
                }else if(state is HomeTabSuccessState){
                  return _buildCategoryBrandSec(list: state.categoryList!);
                }else{
                  return MainLoadingWidget();
                }

                }, ),

            _lineBreak(name: "Brands"),
            BlocBuilder<HomeTabViewModel , HomeTabStates>(
              bloc: viewModel,
              builder: (context, state) {

                if(state is BrandErrorState){
                  return MainErrorWidget(errorMessage: state.errorMessage, onPressed: () {
                    viewModel.getAllBrands();
                  },);
                }else if(state is HomeTabSuccessState){
                  return _buildCategoryBrandSec(list: state.brandsList?? []);
                }else{
                  return MainLoadingWidget();
                }

              }, ),
          ],
        ),
      ),

    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
    return ImageSlideshow(
      indicatorColor: AppColors.primaryColor,
      initialPage: 0,
      indicatorBottomPadding: 15.h,
      indicatorPadding: 8.w,
      indicatorRadius: 5,
      indicatorBackgroundColor: AppColors.whiteColor,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 220.h,
      children: images.map((url){
        return Image.asset(
          url,
          fit: BoxFit.fill,
        );
      }).toList(),
    );
  }

   SizedBox _buildCategoryBrandSec({ required List<CategoryOrBrand> list}){
    return SizedBox(
      height: 240.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 1,
        ),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder:(context, index) {
          return CategoryBrandItems(item: list[index]);
        },
      ),
    );
  }

  Widget _lineBreak({required String name}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name , style: AppStyles.medium18Header,),
        TextButton(onPressed:
        (){
          // todo : navigate to all
        },
            child:
            Text("View All " , style: AppStyles.regular12,)

        )
      ],
    );
  }
}
