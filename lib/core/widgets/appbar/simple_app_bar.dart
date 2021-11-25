import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whole_snack/core/constants/default_values.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool haveBackArrow;
  final action;

  const SimpleAppBar(
      {Key? key, required this.title, required this.haveBackArrow, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: KAppBarTitleFontSize.sp,
          ),
        ),
        backgroundColor: Colors.white,
        leading: haveBackArrow
            ? IconButton(
                onPressed: action,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )
            : Container());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
