import 'package:stripcard/utils/basic_screen_import.dart';
import 'back_button.dart';

class AppBarWidget extends AppBar {
  final String text;

  final VoidCallback? onTap;
  final List<Widget>? actions;
  AppBarWidget({
    required this.text,
    this.onTap,
    this.actions,
    super.key,
  }) : super(
          title: TitleHeading1Widget(
            text: text,
            fontWeight: FontWeight.w500,
            color: const Color(0xff130138),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: BackButtonWidget(),
          actions: actions,
        );
}
