import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/core/utils/toast_utils.dart';
import 'package:e_commerece_app/core/widget/main_error_widget.dart';
import 'package:e_commerece_app/core/widget/main_loading_state.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_states.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/cubit/product_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreenTab extends StatefulWidget {
  const ProductScreenTab({super.key});

  @override
  State<ProductScreenTab> createState() => _ProductScreenTabState();
}

class _ProductScreenTabState extends State<ProductScreenTab> {
  final ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CartScreenViewModel, CartStates>(
        listener: (context, state) {
          if (state is AddCartSuccessState) {
            ToastUtils.toastMessage(
              message: 'Added Successfully',
              backgroundColor: AppColors.greenColor,
              textColor: AppColors.whiteColor,
            );
          } else if (state is AddCartErrorState) {
            ToastUtils.toastMessage(
              message: state.errorMessage,
              backgroundColor: Colors.red,
              textColor: AppColors.whiteColor,
            );
          }
        },
        child: BlocBuilder<ProductViewModel, ProductStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const MainLoadingWidget();
            }

            if (state is ProductErrorState) {
              return MainErrorWidget(
                errorMessage: state.errorMessage,
                onPressed: () {
                  viewModel.getAllProducts();
                },
              );
            }

            if (state is ProductSuccessState) {
              return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 16.h,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.3,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: state.productsList.length,
                itemBuilder: (context, index) {
                  final product = state.productsList[index];

                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.productDetailsRoute,
                        arguments: product,
                      );
                    },
                    child: ProductTabItems(product: product),
                  );
                },
              );
            }

            return const MainLoadingWidget();
          },
        ),
      ),
    );
  }
}