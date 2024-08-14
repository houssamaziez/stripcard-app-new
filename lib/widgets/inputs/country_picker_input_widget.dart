import 'package:google_fonts/google_fonts.dart';
import 'package:stripcard/utils/basic_screen_import.dart';
import '../../backend/model/profile/profile_info_model.dart';

class CountryDropDown extends StatelessWidget {
  final RxString selectMethod;
  final List<Country> itemsList;
  final void Function(Country?)? onChanged;

  const CountryDropDown({
    required this.itemsList,
    Key? key,
    required this.selectMethod,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 1,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          child: Stack(
            children: [
              Positioned(
                right: 0,
                child: Container(
                  height: Dimensions.inputBoxHeight * 1,
                  width: 55,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius * 0.5),
                          bottomRight:
                              Radius.circular(Dimensions.radius * 0.5))),
                ),
              ),
              DropdownButtonHideUnderline(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.paddingSize * 0.2,
                      right: Dimensions.paddingSize * 0.7),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    dropdownColor: CustomColor.primaryLightColor,
                    hint: Padding(
                      padding: EdgeInsets.only(
                        left: Dimensions.paddingSize * 0.7,
                        right: Dimensions.paddingSize * 0.7,
                      ),
                      child: Text(
                        selectMethod.value,
                        style: GoogleFonts.inter(
                          fontSize: Dimensions.headingTextSize4,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    icon: Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: Dimensions.paddingSize * 0.12,
                            left: Dimensions.paddingSize * 0.5),
                        child: Icon(Icons.arrow_drop_down, color: Colors.white),
                      ),
                    ),
                    isExpanded: true,
                    menuMaxHeight: 350.h,
                    borderRadius: BorderRadius.circular(Dimensions.radius),
                    items: itemsList.map<DropdownMenuItem<Country>>((value) {
                      return DropdownMenuItem<Country>(
                        value: value,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.paddingSize * 0.53),
                          child: Text(
                            value.name,
                            style: GoogleFonts.inter(
                              color: selectMethod.value == value.name
                                  ? Colors.black
                                  : CustomColor.whiteColor,
                              fontSize: Dimensions.headingTextSize3,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
