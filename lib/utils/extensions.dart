import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizedBoxExtension on num {
  SizedBox get sH => SizedBox(height: toDouble().h);
  SizedBox get sW => SizedBox(width: toDouble().w);
}


extension BorderRadiusExtension on num {
  BorderRadius get radius => BorderRadius.circular(toDouble().r);
  BorderRadius get radiusAll => BorderRadius.all(toDouble().radiusCircular);
  Radius get radiusCircular => Radius.circular(toDouble().r);
}
