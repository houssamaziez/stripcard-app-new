import 'package:stripcard/controller/navbar/navbar_controller.dart';
import 'package:stripcard/utils/basic_screen_import.dart';
import 'package:stripcard/views/others/custom_image_widget.dart';
import '../../controller/navbar/dashboard_controller.dart';
import '../../widgets/bottom_navbar/bottom_navber.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../drawer/screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  BottomNavBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final bottomNavBarController = Get.put(NavbarController(), permanent: false);

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final dashBoardController = Get.put(DashBoardController());
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildNavItem(int index, IconData icon, String label,
        String iconselc, String iconnoselct) {
      bool isSelected = _selectedIndex == index;
      return GetBuilder<NavbarController>(
          init: NavbarController(),
          builder: (contr) {
            return GestureDetector(
              onTap: () => contr.selectedPage(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    contr.selectedIndex == index ? iconselc : iconnoselct,
                    height: 24,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      color: contr.selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          });
    }

    return Obx(
      () => Scaffold(
        drawer: CustomDrawer(),
        key: scaffoldKey,
        appBar: appBarWidget(context),
        extendBody: true,
        backgroundColor: Colors.white,
        // bottomNavigationBar:
        // buildBottomNavigationMenu(context, bottomNavBarController),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home, 'Home', "assets/icon/home.png",
                  "assets/icon/homeS.png"),
              _buildNavItem(1, Icons.search, 'Cards', "assets/icon/cardS.png",
                  "assets/icon/card.png"),
              _buildNavItem(
                2,
                Icons.person,
                'Transfer',
                "assets/icon/chngS.png",
                "assets/icon/chng.png",
              ),
              _buildNavItem(3, Icons.settings, 'Trancaction',
                  "assets/icon/ttttt.png", "assets/icon/listn.png"),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: bottomNavBarController
            .page[bottomNavBarController.selectedIndex.value],
      ),
    );
  }

  appBarWidget(BuildContext context) {
    return bottomNavBarController.selectedIndex.value == 0
        ? AppBar(
            backgroundColor: Colors.white,
            elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 0,
            centerTitle:
                bottomNavBarController.selectedIndex.value == 0 ? true : false,
            leading: bottomNavBarController.selectedIndex.value == 0
                ? GestureDetector(
                    onTap: () {
                      if (dashBoardController.isLoading == false) {
                        scaffoldKey.currentState!.openDrawer();
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.paddingSize,
                            right: Dimensions.paddingSize * 0.2),
                        child: CustomImageWidget(
                          path: Assets.icon.drawerMenu,
                          height: 17.h,
                          width: 17.w,
                          color: CustomColor.whiteColor,
                        )),
                  )
                : Container(),
            title: bottomNavBarController.selectedIndex.value == 0
                ? Padding(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                    child: TitleHeading4Widget(
                      text: 'Home',
                      fontWeight: FontWeight.w400,
                      color: Color(0xff130138),
                      fontSize: Dimensions.headingTextSize5 * 2,
                    ),
                  )
                : Container(),
            actions: [
              bottomNavBarController.selectedIndex.value == 0
                  ? Padding(
                      padding:
                          EdgeInsets.only(right: Dimensions.paddingSize * 0.6),
                      child: GestureDetector(
                        onTap: () {
                          // Get.toNamed(Routes .updateProfileScreen);
                          Get.to(ScreenMenu());
                        },
                        child: Image.asset(
                          "assets/icon/User-40.png",
                          height: 42,
                        ),
                      ),
                    )
                  : Container(),
            ],
          )
        : null;
  }
}
