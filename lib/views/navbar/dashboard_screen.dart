import 'package:stripcard/backend/utils/custom_loading_api.dart';
import 'package:stripcard/controller/categories/virtual_card/flutter_wave/flutterwave_card_controller.dart';
import 'package:stripcard/utils/basic_screen_import.dart';
import 'package:stripcard/views/categories/virtual_card/sudo_virtual_card/sudo_add_fund_screen.dart';
import 'package:stripcard/widgets/others/custom_glass/custom_glass_widget.dart';
import '../../backend/utils/custom_snackbar.dart';
import '../../controller/categories/virtual_card/stripe_card/stripe_card_controller.dart';
import '../../controller/categories/virtual_card/strowallet_card/strowallelt_info_controller.dart';
import '../../controller/categories/virtual_card/sudo_card/sudo_my_card_controller.dart';
import '../../controller/navbar/dashboard_controller.dart';
import '../../controller/navbar/navbar_controller.dart';
import '../../controller/navbar/usefull_link_controller.dart';
import '../../controller/profile/update_profile_controller.dart';
import '../../data/categories_stripe_data.dart';
import '../../data/flutter_wave_data.dart';
import '../../widgets/bottom_navbar/categorie_widget.dart';
import '../../widgets/bottom_navbar/flutter_card.dart';
import '../../widgets/bottom_navbar/stripe_slider_card.dart';
import '../../widgets/bottom_navbar/sudo_slider_card.dart';
import '../../widgets/bottom_navbar/transaction_history_widget.dart';
import 'package:intl/intl.dart';
import '../categories/virtual_card/strowallet_card/strowallet_slider.dart';
import '../categories/withdraw/withdraw_screen.dart';
import '../gift_card/gift_card_screen.dart';
import '../money_transfer/money_transfer_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final dashBoardController = Get.put(DashBoardController());
  final myCardController = Get.put(StripeCardController());
  final sudoCardController = Get.put(VirtualSudoCardController());
  final flutterWaveCardController = Get.put(FlutterWaveCardController());
  final useFullLinkController = Get.put(UseFullLinkController());
  final strowalletCardController = Get.put(VirtualStrowalletCardController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileScaffold: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: Obx(
          () => dashBoardController.isLoading ||
                  myCardController.isLoading ||
                  sudoCardController.isLoading ||
                  flutterWaveCardController.isLoading ||
                  strowalletCardController.isLoading ||
                  useFullLinkController.isLoading
              ? CustomLoadingAPI(
                  color: CustomColor.primaryLightColor,
                )
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    var data = dashBoardController.dashBoardModel.data;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<UpdateProfileController>(
                init: UpdateProfileController(),
                builder: (cont) {
                  return Row(
                    children: [
                      Text(
                        "Good morning, ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        cont.isLoading
                            ? ''
                            : cont.userProfileModel.data.user.firstname,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 158,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xff978CD0),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'klasha',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/icon/card-edit.png",
                          height: 24,
                        )
                      ],
                    ),
                    Text(
                      'Burble Card',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'virtual card name',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      '****  ****  ****  1234',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          "${data.userWallet.balance.toString()} ${data.userWallet.currency}",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "VISA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 101,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffDCD9EF),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(MonetTransferScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0XFF978CD0)),
                            child: Center(
                              child: Image.asset(
                                "assets/icon/import.png",
                                height: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Send",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(MoneyOutScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0XFF978CD0)),
                            child: Center(
                              child: Image.asset(
                                "assets/icon/withdraw.png",
                                height: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Withdraw",
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(GiftCardScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0XFF978CD0)),
                            child: Center(
                              child: Image.asset(
                                "assets/icon/Gift.png",
                                height: 20,
                              ),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Gift Cards",
                            style: TextStyle(color: Colors.black),
                          ),
                          Spacer()
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Last Transaction",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dashBoardController
                      .dashBoardModel.data.transactions.length,
                  itemBuilder: (contaxt, index) {
                    var data = dashBoardController
                        .dashBoardModel.data.transactions[index];

                    return TransactionWidget(
                      amount: data.requestAmount,
                      title: data.transactionType,
                      dateText: DateFormat.d().format(data.dateTime),
                      transaction: data.trx,
                      monthText: DateFormat.MMM().format(data.dateTime),
                    );
                  }),
            ),
            // Expanded(
            //   child: Stack(
            //     children: [
            //       _draggableSheet(context),
            //       RefreshIndicator(
            //         color: CustomColor.primaryLightColor,
            //         onRefresh: () async {
            //           dashBoardController.getDashboardData().then((value) {
            //             if (dashBoardController
            //                     .dashBoardModel.data.activeVirtualSystem ==
            //                 'flutterwave') {
            //               flutterWaveCardController.getCardData();
            //             } else if (dashBoardController
            //                     .dashBoardModel.data.activeVirtualSystem ==
            //                 'sudo') {
            //               sudoCardController.getCardData();
            //             } else if (dashBoardController
            //                     .dashBoardModel.data.activeVirtualSystem ==
            //                 'strowallet') {
            //               strowalletCardController.getStrowalletCardData();
            //             } else {
            //               stripeCardController.getStripeCardData();
            //             }
            //           });
            //         },
            //         child: ListView(
            //           children: [
            //             // _appBarContainer(context),
            //             // dashBoardController
            //             //             .dashBoardModel.data.activeVirtualSystem ==
            //             //         'sudo'
            //             //     ? _cardSudoWidget(context)
            //             //     : dashBoardController.dashBoardModel.data
            //             //                 .activeVirtualSystem ==
            //             //             'stripe'
            //             //         ? _stripeCardWidget(context)
            //             //         : dashBoardController.dashBoardModel.data
            //             //                     .activeVirtualSystem ==
            //             //                 'flutterwave'
            //             //             ? _cardWidget(context)
            //             //             : _strowalletCardWidget(context),
            //           ],
            //         ),
            //       ),
            //       _draggableSheet(context),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  _draggableSheet(BuildContext context) {
    var data = dashBoardController.dashBoardModel.data.transactions;
    return Visibility(
      visible: data.isNotEmpty,
      child: DraggableScrollableSheet(
        builder: (_, scrollController) {
          return _transactionWidget(context, scrollController);
        },
        initialChildSize: 0.25,
        minChildSize: 0.25,
        maxChildSize: 1,
      ),
    );
  }

  _appBarContainer(BuildContext context) {
    var data = dashBoardController.dashBoardModel.data;
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.17,
      decoration: BoxDecoration(
          color: CustomColor.primaryBGLightColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(Dimensions.radius * 2),
            bottomRight: Radius.circular(Dimensions.radius * 2),
          )),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          CustomTitleHeadingWidget(
            text:
                "${data.userWallet.balance.toString()} ${data.userWallet.currency}",
            style: CustomStyle.darkHeading1TextStyle.copyWith(
              fontSize: Dimensions.headingTextSize4 * 2,
              fontWeight: FontWeight.w800,
              color: CustomColor.whiteColor,
            ),
          ),
          CustomTitleHeadingWidget(
            text: Strings.currentBalance,
            style: CustomStyle.lightHeading4TextStyle.copyWith(
              fontSize: Dimensions.headingTextSize3,
              color: CustomColor.whiteColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  ///>>>flutter widget
  _cardWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Visibility(
      visible: flutterWaveCardController.myCardModel.data.myCards.isNotEmpty,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimensions.radius * 2,
          ),
          color: CustomColor.primaryLightColor,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.8,
          vertical: Dimensions.marginSizeVertical * 0.4,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSize * 0.4,
          vertical: Dimensions.paddingSize * 0.2,
        ),
        child: Column(
          mainAxisAlignment: mainCenter,
          children: [
            _cardRowWidget(context),
            FlutterWaveSlider(),
            _cardCategories(context),
          ],
        ),
      ),
    );
  }

  _transactionWidget(BuildContext context, ScrollController scrollController) {
    var data = dashBoardController.dashBoardModel.data.transactions;

    return data.isEmpty
        ? Container()
        : ListView(
            padding:
                EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.8),
            physics: NeverScrollableScrollPhysics(),
            children: [
              verticalSpace(Dimensions.heightSize),
              CustomTitleHeadingWidget(
                text: Strings.recentTransaction,
                style: Get.isDarkMode
                    ? CustomStyle.lightHeading3TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize2,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.primaryLightTextColor)
                    : CustomStyle.darkHeading3TextStyle.copyWith(
                        fontSize: Dimensions.headingTextSize2,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.primaryLightTextColor),
              ),
              verticalSpace(Dimensions.widthSize),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return TransactionWidget(
                        amount: data[index].requestAmount,
                        title: data[index].transactionType,
                        dateText: DateFormat.d().format(data[index].dateTime),
                        transaction: data[index].trx,
                        monthText:
                            DateFormat.MMM().format(data[index].dateTime),
                      );
                    }),
              )
            ],
          ).customGlassWidget();
  }

  _cardRowWidget(BuildContext context) {
    final controller = Get.put(NavbarController());
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.3),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          TitleHeading2Widget(
            text: Strings.myCard.tr,
            fontWeight: FontWeight.w600,
          ),
          GestureDetector(
            onTap: () {
              controller.selectedIndex.value = 3;
            },
            child: TitleHeading4Widget(
              text: Strings.viewAll.tr,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  _cardCategories(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.3),
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      children: List.generate(
        flutterCategoriesData.length,
        (index) => CategoriesWidget(
          onTap: flutterCategoriesData[index].onTap,
          icon: flutterCategoriesData[index].icon,
          text: flutterCategoriesData[index].text,
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }

  _stripeCardCategories(BuildContext context) {
    return Visibility(
      visible: myCardController.stripeCardModel.data.myCard.isNotEmpty,
      child: GridView.count(
        padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.3),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          categoriesStripeData.length,
          (index) => CategoriesWidget(
            onTap: categoriesStripeData[index].onTap,
            icon: categoriesStripeData[index].icon,
            text: categoriesStripeData[index].text,
            color: CustomColor.whiteColor,
          ),
        ),
      ),
    );
  }

  ///>>>>>>stripe card
  _stripeCardWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.primaryLightColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
        vertical: Dimensions.paddingSize * 0.2,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        mainAxisSize: mainMin,
        children: [
          _cardRowWidget(context),
          DashboardSlider(),
          _stripeCardCategories(context),
        ],
      ),
    );
  }

  ///>>> sudo widget
  _cardSudoWidget(BuildContext context) {
    final data = sudoCardController.sudoMyCardModel.data.myCard;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.primaryLightColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
        vertical: Dimensions.paddingSize * 0.2,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _cardRowWidget(context),
          SudoDashboardSlider(),
          Visibility(
            visible: sudoCardController.sudoMyCardModel.data.myCard.isNotEmpty,
            child: Container(
              margin: EdgeInsets.only(
                  bottom: Dimensions.marginSizeVertical,
                  top: Dimensions.marginSizeVertical * 0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoriesWidget(
                    icon: Assets.icon.details,
                    text: Strings.details,
                    onTap: () {
                      if (sudoCardController
                          .sudoMyCardModel.data.myCard.isNotEmpty) {
                        Get.toNamed(Routes.sudoCardDetailsScreen);
                      } else {
                        CustomSnackBar.error(Strings.youDonNotBuyCard);
                      }
                      ;
                    },
                    color: CustomColor.whiteColor,
                  ),
                  Obx(
                    () => sudoCardController.isDefaultLoading
                        ? CustomLoadingAPI(
                            color: CustomColor.primaryLightColor,
                          )
                        : CategoriesWidget(
                            icon: Assets.icon.torch,
                            text: data[dashBoardController.current.value]
                                        .isDefault ==
                                    true
                                ? Strings.removeDefault
                                : Strings.makeDefault,
                            onTap: () {
                              sudoCardController.defaultProcess();
                            },
                            color: CustomColor.whiteColor,
                          ),
                  ),
                  CategoriesWidget(
                    icon: Assets.icon.fundCard,
                    text: Strings.addFund,
                    onTap: () {
                      if (sudoCardController
                          .sudoMyCardModel.data.myCard.isNotEmpty) {
                        Get.to(() => SudoAddFundScreen(
                              appBarTitle: Strings.addFund,
                            ));
                      } else {
                        CustomSnackBar.error(
                          Strings.youDonNotBuyCard,
                        );
                      }
                    },
                    color: CustomColor.whiteColor,
                  ),
                  CategoriesWidget(
                    icon: Assets.icon.transactionCard,
                    text: Strings.transactions,
                    onTap: () {
                      if (sudoCardController
                          .sudoMyCardModel.data.myCard.isNotEmpty) {
                        Get.toNamed(Routes.sudoTransactionHistoryScreen);
                      } else {
                        CustomSnackBar.error(
                          Strings.youDonNotBuyCard,
                        );
                      }
                    },
                    color: CustomColor.whiteColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // strowallet
  _strowalletCardWidget(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 2,
        ),
        color: CustomColor.primaryLightColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
        vertical: Dimensions.marginSizeVertical * 0.4,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSize * 0.8,
        vertical: Dimensions.paddingSize * 0.2,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        mainAxisSize: mainMin,
        children: [
          StrowalletSlider(),
          _strowalletCardCategoryWidget(context),
        ],
      ),
    );
  }

  _strowalletCardCategoryWidget(BuildContext context) {
    final controller = Get.put(VirtualStrowalletCardController());
    return Visibility(
      visible: controller.strowalletCardModel.data.myCards.isNotEmpty,
      child: GridView.count(
        padding: EdgeInsets.only(top: Dimensions.paddingSize * 0.3),
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
        shrinkWrap: true,
        children: [
          CategoriesWidget(
              icon: Assets.icon.details,
              text: Strings.details,
              color: CustomColor.whiteColor,
              onTap: () {
                controller.getStrowalletCardData();
                if (controller.strowalletCardModel.data.myCards.isNotEmpty) {
                  Get.toNamed(Routes.strowalletCardDetailsScreen);
                } else {
                  CustomSnackBar.error(Strings.youDonNotBuyCard);
                }
              }),
          CategoriesWidget(
              icon: Assets.icon.fundCard,
              text: Strings.fund,
              color: CustomColor.whiteColor,
              onTap: () {
                controller.getStrowalletCardData();
                if (controller.strowalletCardModel.data.myCards.isNotEmpty) {
                  Get.toNamed(Routes.strowalletAddFundScreen);
                } else {
                  CustomSnackBar.error(
                    Strings.youDonNotBuyCard,
                  );
                }
              }),
          Obx(
            () => controller.isMakeDefaultLoading
                ? const CustomLoadingAPI()
                : CategoriesWidget(
                    icon: Assets.icon.torch,
                    color: CustomColor.whiteColor,
                    text: controller
                            .strowalletCardModel
                            .data
                            .myCards[
                                controller.dashboardController.current.value]
                            .isDefault
                        ? Strings.removeDefault
                        : Strings.makeDefault,
                    onTap: () {
                      controller.makeCardDefaultProcess(
                        controller
                            .strowalletCardModel
                            .data
                            .myCards[
                                controller.dashboardController.current.value]
                            .cardId,
                      );
                    },
                  ),
          ),
          CategoriesWidget(
            icon: Assets.icon.transactionsLog,
            text: Strings.transactions,
            color: CustomColor.whiteColor,
            onTap: () {
              controller.getStrowalletCardData();
              if (controller.strowalletCardModel.data.myCards.isNotEmpty) {
                Get.toNamed(Routes.strowalletTransactionHistoryScreen);
              } else {
                CustomSnackBar.error(
                  Strings.youDonNotBuyCard,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
