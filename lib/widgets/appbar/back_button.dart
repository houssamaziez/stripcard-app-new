import 'package:stripcard/utils/basic_screen_import.dart';

import '../../views/others/custom_image_widget.dart';
import 'dart:io' show Platform;

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: Dimensions.paddingSizeHorizontalSize * .5,
          top: Dimensions.paddingSizeVerticalSize * .3,
          bottom: Dimensions.paddingSizeVerticalSize * .3),
      child: GestureDetector(
        onTap: onTap ??
            () {
              Get.close(1);
            },
        child: CircleAvatar(
          radius: Platform.isAndroid ? 26.r : 33.r,
          backgroundColor: Color(0xffDCD9EF),
          child: Padding(
            padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.1),
            child: CustomImageWidget(
              path: Assets.icon.backward,
              color: Theme.of(context).primaryColor,
              height: Dimensions.heightSize * 2.4,
              width: Dimensions.widthSize * 2,
            ),
          ),
        ),
      ),
    );
  }
}
