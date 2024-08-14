import 'package:stripcard/utils/basic_widget_import.dart';
import '../appbar/back_button.dart';

class TransactionAppBarWidget extends AppBar {
  final String text;
  final VoidCallback? onTapLeading;
  final bool homeButtonShow;
  final PreferredSizeWidget? bottomBar;

  TransactionAppBarWidget(
      {required this.text,
      this.onTapLeading,
      this.homeButtonShow = false,
      this.bottomBar,
      super.key})
      : super(
          title: TitleHeading1Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Visibility(
              visible: homeButtonShow,
              child: IconButton(
                  onPressed: onTapLeading,
                  icon: const Icon(
                    Icons.home,
                    color: CustomColor.primaryLightColor,
                  )),
            )
          ],
          bottom: bottomBar,
          leading: BackButtonWidget(
            onTap: onTapLeading ??
                () {
                  Get.close(1);
                },
          ),
        );
}
