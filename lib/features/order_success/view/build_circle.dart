import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildCircle extends StatelessWidget {
  const BuildCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).primaryColor.withOpacity(0.4),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
          child: Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Icon(
                Icons.check,
                size: 64.sp,
                color: Theme.of(context).scaffoldBackgroundColor,
              )),
        ),
      ),
    );
  }
}
