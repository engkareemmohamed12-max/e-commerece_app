import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../domain/entities/response/common/category_or_brand.dart';

class CategoryBrandItems extends StatelessWidget {
  final CategoryOrBrand item;
  const CategoryBrandItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CachedNetworkImage(
          imageUrl: item.image ?? '',
          imageBuilder: (context, imageProvider) {
            return Container(
              width: 70.w,
              height: 70.h,
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[50],
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
          placeholder: (context, url) => SizedBox(
            width: 70.w,
            height: 70.h,
            child: const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryDark,
                strokeWidth: 2,
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            width: 70.w,
            height: 70.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.error, color: AppColors.redColor),
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          item.name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.primaryDark,
            fontWeight: FontWeight.normal,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}