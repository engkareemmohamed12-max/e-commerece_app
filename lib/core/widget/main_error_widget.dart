import 'package:e_commerece_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';


class MainErrorWidget extends StatelessWidget {

  final String errorMessage ;
  final VoidCallback onPressed ;

  const MainErrorWidget({super.key , required this.errorMessage
    , required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text( errorMessage ,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        ElevatedButton(onPressed: onPressed,
          child: Text('Try again' ,
            style: AppStyles.medium18Header,
          ),
        )
      ],
    );
  }
}
