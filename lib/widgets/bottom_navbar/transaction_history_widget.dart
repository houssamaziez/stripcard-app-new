import '../../utils/basic_screen_import.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget(
      {super.key,
      required this.amount,
      required this.title,
      required this.dateText,
      required this.transaction,
      required this.monthText});
  final String title, monthText, dateText, amount, transaction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.paddingSize * 0.3),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 206, 206, 206)
                  .withOpacity(0.5), // Shadow color with opacity
              spreadRadius: 0.2, // How far the shadow spreads
              blurRadius: 7, // How much the shadow is blurred
              offset: Offset(0, 3), // The position of the shadow (x, y)
            ),
          ],
          borderRadius: BorderRadius.circular(12),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.2),
        // height: Dimensions.heightSize * 6,
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.marginSizeVertical * 0.4,
                    top: Dimensions.marginSizeVertical * 0.5,
                    bottom: Dimensions.marginSizeVertical * 0.4,
                    right: Dimensions.marginSizeVertical * 0.2,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.6),
                  ),
                  child: Column(
                    mainAxisAlignment: mainCenter,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: crossCenter,
                    children: [
                      TitleHeading4Widget(
                        text: dateText,
                        fontSize: Dimensions.headingTextSize3 * 2,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      TitleHeading4Widget(
                        text: monthText,
                        fontSize: Dimensions.headingTextSize6,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  TitleHeading3Widget(
                    text: title,
                    maxLines: 1,
                    color: Colors.black,
                    fontSize: Dimensions.headingTextSize4 + 1,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  verticalSpace(Dimensions.widthSize * 0.7),
                  CustomTitleHeadingWidget(
                    text: transaction,
                    style: CustomStyle.darkHeading4TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize5,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: TitleHeading4Widget(
                text: amount,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
