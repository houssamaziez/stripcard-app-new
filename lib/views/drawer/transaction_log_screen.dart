import 'package:stripcard/utils/basic_screen_import.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/drawer/transaction_controller.dart';
import '../../widgets/drawer/transaction_appbar_widget.dart';
import 'transaction_tabs/add_subtract_balance.dart';
import 'transaction_tabs/addmoney_transaction_screen.dart';
import 'transaction_tabs/transfer_money_screen.dart';
import 'transaction_tabs/virtual_card_transaction.dart';

class TransactionLogScreen extends StatelessWidget {
  TransactionLogScreen({super.key});

  final controller = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: TransactionAppBarWidget(
              text: Strings.transactionLog.tr,
              bottomBar: PreferredSize(
                preferredSize: _tabBarWidget.preferredSize,
                child: ColoredBox(
                  color: Colors.white,
                  child: _tabBarWidget,
                ),
              )),
          body: Obx(
            () => controller.isLoading
                ? const CustomLoadingAPI()
                : _bodyWidget(context),
          ),
        ),
      ),
    );
  }

  // tab bar widget
  TabBar get _tabBarWidget => TabBar(
        dividerHeight: 0,
        padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.4),
        isScrollable: true,
        labelColor: Colors.white,
        unselectedLabelColor: CustomColor.primaryLightTextColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: CustomStyle.lightHeading4TextStyle.copyWith(
          color: CustomColor.primaryLightColor,
          fontSize: Dimensions.headingTextSize4,
        ),
        unselectedLabelStyle: CustomStyle.lightHeading4TextStyle.copyWith(
          color: CustomColor.primaryLightTextColor,
          fontSize: Dimensions.headingTextSize4,
        ),
        indicator: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          color: CustomColor.primaryLightColor,
        ),
        tabs: [
          Tab(
            child: TitleHeading4Widget(
              text: Strings.addMoney.tr,
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: TitleHeading4Widget(
              text: Strings.transferMoney.tr,
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: TitleHeading4Widget(
              text: Strings.virtualCard.tr,
              textAlign: TextAlign.center,
            ),
          ),
          Tab(
            child: TitleHeading4Widget(
              text: Strings.addSubtractBalance.tr,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  _bodyWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.5,
      ),
      child: TabBarView(
        physics: const BouncingScrollPhysics(),
        children: [
          AddMoneyLogScreen(controller: controller),
          SendMoneyLogScreen(controller: controller),
          VirtualCardLogScreen(controller: controller),
          AddSubtractBalanceLogScreen(controller: controller),
        ],
      ),
    );
  }
}
