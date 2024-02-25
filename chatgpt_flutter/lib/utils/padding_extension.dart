// 扩展 int
import 'package:flutter/cupertino.dart';

extension IntFix on int {
  SizedBox get paddingHeight {
    return SizedBox(height: toDouble());
  }

  SizedBox get paddingWidth {
    return SizedBox(width: toDouble());
  }
}

// 扩展 double
extension DoubleFix on double {
  SizedBox get paddingHeight {
    return SizedBox(height: this);
  }

  SizedBox get paddingWidth {
    return SizedBox(width: this);
  }
}
