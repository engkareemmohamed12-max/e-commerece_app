import 'package:e_commerece_app/core/di/di.dart';
import 'package:e_commerece_app/core/utils/app_routes.dart';
import 'package:e_commerece_app/core/widget/main_error_widget.dart';
import 'package:e_commerece_app/core/widget/main_loading_state.dart';
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

  ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<ProductViewModel , ProductStates>(
          bloc: viewModel,
          builder: (context, state) {
            if(state is ProductErrorState){
              return MainErrorWidget(errorMessage: state.errorMessage,
                  onPressed: (){});
            }else if(state is ProductSuccessState){
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.3,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h
                      ),
                      itemCount: state.productsList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            // todo : navigate to product details screen
                            Navigator.pushNamed(context, AppRoutes.productDetailsRoute ,
                            arguments: state.productsList[index]
                            );
                          },
                          child:  ProductTabItems(product: state.productsList[index]),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else{
              return MainLoadingWidget();
            }
          },

        )
    );

  }
}
