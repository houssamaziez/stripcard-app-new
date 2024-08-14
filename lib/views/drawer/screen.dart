import 'package:flutter/material.dart';

import '../../backend/services/api_endpoint.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/auth/log_out/log_out.dart';
import '../../controller/navbar/dashboard_controller.dart';
import '../../controller/profile/update_profile_controller.dart';
import '../../routes/routes.dart';
import '../../utils/basic_screen_import.dart';
import '../../widgets/appbar/back_button.dart';
import '../../widgets/others/image_picker/image_picker_widget.dart';
import '../Setting/language.dart';
import '../profile/update_profile_screen.dart';

class ScreenMenu extends StatefulWidget {
  ScreenMenu({super.key});

  @override
  State<ScreenMenu> createState() => _ScreenMenuState();
}

class _ScreenMenuState extends State<ScreenMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final controller = Get.put(DashBoardController());
  final logOutController = Get.put(LogOutController());

  _logOutDialogueWidget(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          alignment: Alignment.center,
          insetPadding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Builder(
            builder: (context) {
              var width = MediaQuery.of(context).size.width;
              return Container(
                width: width * 0.84,
                margin: EdgeInsets.all(Dimensions.paddingSize * 0.5),
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.9),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? CustomColor.primaryBGDarkColor
                      : CustomColor.whiteColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius * 1.4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: crossCenter,
                  children: [
                    SizedBox(height: Dimensions.heightSize * 2),
                    TitleHeading2Widget(
                        color: CustomColor.thirdLightTextColor,
                        text: Strings.signOutAlert.tr),
                    verticalSpace(Dimensions.heightSize * 1),
                    TitleHeading4Widget(
                        color: CustomColor.thirdLightTextColor,
                        text: Strings.doYouWant.tr),
                    verticalSpace(Dimensions.heightSize * 1),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .25,
                            child: PrimaryButton(
                              title: Strings.no.tr,
                              onPressed: () {
                                Get.back();
                              },
                              borderColor: CustomColor.secondaryLightTextColor,
                              buttonColor: CustomColor.secondaryLightTextColor,
                            ),
                          ),
                        ),
                        horizontalSpace(Dimensions.widthSize),
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .25,
                            child: Obx(
                              () => logOutController.isLoading
                                  ? const CustomLoadingAPI(
                                      color: CustomColor.primaryLightColor,
                                    )
                                  : PrimaryButton(
                                      title: Strings.yes.tr,
                                      onPressed: () {
                                        logOutController.logOutProcess();
                                      },
                                      borderColor:
                                          Theme.of(context).primaryColor,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  _imgWidget(BuildContext context) {
    return ImagePickerWidget(
      isprofile: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<ItemSetting> listitem = [
      ItemSetting("Edit profile", "assets/icon/edteprofile.png", () {
        print('object');
        Get.to(UpdateProfileScreen());
      }),
      ItemSetting("kyc verification", "assets/icon/mingcute_edit-line.png", () {
        Get.toNamed(Routes.kycScreen);
      }),
      // ItemSetting("notification", "assets/icon/notification-bing.png", () {}),
      ItemSetting("language", "assets/icon/material-symbols-light_language.png",
          () {
        Get.to(LangaugeScreen());
      }),
      ItemSetting(
          "password", "assets/icon/material-symbols-light_lock-outline.png",
          () {
        Get.toNamed(Routes.changePasswordScreen);
      }),
      ItemSetting("sign out", "assets/icon/lets-icons_sign-out-squre-light.png",
          () {
        _logOutDialogueWidget(context);
      }),
      ItemSetting("About us", "assets/icon/carbon_information.png", () {
        Get.toNamed(Routes.aboutUs);
      }),
      ItemSetting("privacy policy",
          "assets/icon/material-symbols_privacy-tip-outline.png", () {
        Get.toNamed(Routes.privacyPolicy);
      }),
      ItemSetting("help center", "assets/icon/formkit_help.png", () {
        Get.toNamed(Routes.helpCenter);
      }),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: BackButtonWidget(
          onTap: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
        title: Text('profile'),
      ),
      body: GetBuilder<UpdateProfileController>(
          init: UpdateProfileController(),
          builder: (cont) {
            return cont.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: _imgWidget(context),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cont.userProfileModel.data.user.firstname,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              cont.userProfileModel.data.user.lastname,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                        Text(
                          cont.userProfileModel.data.user.email,
                          style: TextStyle(color: Colors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                              ),
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: listitem.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: listitem[index].funcntion!,
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 206, 206, 206)
                                              .withOpacity(
                                                  0.5), // Shadow color with opacity
                                          spreadRadius:
                                              0.2, // How far the shadow spreads
                                          blurRadius:
                                              7, // How much the shadow is blurred
                                          offset: Offset(0,
                                              3), // The position of the shadow (x, y)
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          listitem[index].icon,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          listitem[index].title,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  );
          }),
    );
  }
}

class ItemSetting {
  final String title;
  final String icon;
  final void Function()? funcntion;

  ItemSetting(this.title, this.icon, this.funcntion);
}
