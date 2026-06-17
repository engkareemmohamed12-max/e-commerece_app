import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerece_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSlider extends StatefulWidget {
  final List<String> items;
  final int initialIndex;

  const ProductSlider({
    super.key,
    required this.items,
    required this.initialIndex,
  });

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      onPageChanged: (value) {
        setState(() {
          currentIndex = value;
        });
      },
      initialPage: currentIndex,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: Colors.grey.shade300,
      isLoop: true,
      autoPlayInterval: 3000,
      height: 300.h,
      children: widget.items.map((url) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(
              color: AppColors.primary300pacity,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
          ),
        );
      }).toList(),
    );
  }
}