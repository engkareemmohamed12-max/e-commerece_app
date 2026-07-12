import 'package:e_commerece_app/core/widget/main_error_widget.dart';
import 'package:e_commerece_app/core/widget/main_loading_state.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_screen_view_model.dart';
import 'package:e_commerece_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color mainColor = Color(0xFF004182);
    const Color textColor = Color(0xFF06004F);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Cart",
          style: TextStyle(
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: BlocBuilder<CartScreenViewModel, CartStates>(
          bloc: CartScreenViewModel.get(context)..getItemsCart(),
          builder: (context, state) {
            if (state is GetCartErrorState) {
              return MainErrorWidget(
                errorMessage: state.errorMessage,
                onPressed: () {},
              );
            } else if (state is GetCartSuccessState) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8.h),
                      itemCount: state.cartResponse.data?.products?.length ?? 0,
                      itemBuilder: (_, index) {
                        return CartItemWidget(
                          item: state.cartResponse.data!.products![index],
                        );
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16.r),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.sp,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'EGP ${state.cartResponse.data?.totalCartPrice ?? 0}',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 10.w),

                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 50.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.r),
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Check Out',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 6.w),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const MainLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}