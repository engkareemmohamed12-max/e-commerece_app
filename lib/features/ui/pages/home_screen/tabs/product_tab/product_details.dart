import 'package:e_commerece_app/core/utils/app_assets.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:e_commerece_app/domain/entities/response/product/product.dart';
import 'package:e_commerece_app/features/ui/pages/home_screen/tabs/product_tab/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart'; // استيراد الباكدج هنا

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int productCounter = 1;
  int selectedColor = 0;
  int selectedSize = 0;

  List<int> sizes = [38, 39, 40, 41, 42];
  List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Product;

    // حساب السعر الإجمالي بناءً على العداد
    double totalPrice = ((args.price ?? 0) * productCounter).toDouble();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
          style: AppStyles.semi20Primary,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. سلايدر الصور
              ProductSlider(items: args.images ?? [], initialIndex: 0),
              SizedBox(height: 16.h),

              // 2. اسم المنتج والسعر
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? '',
                      style: AppStyles.medium18Header,
                    ),
                  ),
                  Text(
                    "EGP ${args.price}",
                    style: AppStyles.medium18Header,
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 3. عدد المبيعات، التقييم، وعداد الكمية (+ / -)
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primary300pacity ?? Colors.blue.withOpacity(0.3),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      '${args.sold ?? 0} Sold',
                      style: AppStyles.medium14Header,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Image.asset(AppAssets.starIcon, height: 15.h, width: 15.w),
                  SizedBox(width: 4.w),
                  Text(
                    "${args.ratingsAverage ?? 4.8} (${args.ratingsQuantity ?? 0})",
                    style: AppStyles.medium14Header,
                  ),
                  const Spacer(),

                  // عداد التحكم في الكمية
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (productCounter > 1) {
                              setState(() {
                                productCounter--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline, color: Colors.white),
                        ),
                        Text(
                          '$productCounter',
                          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              productCounter++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),

              // 4. الوصف (Description) باستخدام ReadMoreText
              Text("Description", style: AppStyles.medium18Header),
              SizedBox(height: 8.h),
              ReadMoreText(
                args.description ?? '',
                trimLines: 2,
                colorClickableText: AppColors.primaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More',
                trimExpandedText: ' Show Less',
                style: AppStyles.regular14Text ?? TextStyle(color: Colors.grey, fontSize: 14.sp),
                moreStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
                lessStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primaryColor),
              ),

              SizedBox(height: 16.h),

              // 5. المقاسات (Size)
              Text("Size", style: AppStyles.medium18Header),
              SizedBox(height: 8.h),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sizes.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedSize == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.w),
                        width: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryColor : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected ? Colors.transparent : Colors.grey,
                          ),
                        ),
                        child: Text(
                          "${sizes[index]}",
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),

              // 6. الألوان (Color)
              Text("Color", style: AppStyles.medium18Header),
              SizedBox(height: 8.h),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (context, index) {
                    bool isSelected = selectedColor == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.w),
                        width: 35.w,
                        decoration: BoxDecoration(
                          color: colors[index],
                          shape: BoxShape.circle,
                        ),
                        child: isSelected
                            ? const Icon(Icons.check, color: Colors.white)
                            : null,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h),

              // 7. إجمالي السعر وزر الإضافة إلى العربة (Bottom Bar View)
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total price",
                        style: AppStyles.medium18Header ?? TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "EGP $totalPrice",
                        style: AppStyles.medium18Header,
                      ),
                    ],
                  ),
                  SizedBox(width: 32.w),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
                      label: Text(
                        "Add to cart",
                        style: AppStyles.semi24White ?? TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}