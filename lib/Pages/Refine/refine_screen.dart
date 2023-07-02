import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netclan_explore/theme/app_theme.dart';
import 'package:netclan_explore/util/_string.dart';
import 'package:netclan_explore/util/constants.dart';
import 'package:netclan_explore/widgets/Custom_Textfield.dart';
import 'package:netclan_explore/widgets/custom_text.dart';

class Refine extends StatefulWidget {
  const Refine({super.key});

  @override
  State<Refine> createState() => _RefineState();
}

class _RefineState extends State<Refine> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    controller.text = Strings.initalTextForStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.primaryColor,
            automaticallyImplyLeading: Constant.isFalse,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Padding(
                padding:
                    EdgeInsets.only(left: Constant.refineBackIconLeftPadding),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: Constant.refineBackIconSize,
                ),
              ),
            ),
            title: CustomText(
              leftPadding: Constant.refineAppBarfontLeftPadding,
              title: Strings.refine,
              fontfamily: Strings.emptyString,
              fontSize: Constant.refineAppBarfontsize,
              fontWight: FontWeight.bold,
            ),
          ),
          body: _body()),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: Constant.refineCustomLeftPadding,
                right: Constant.refineCustomRightPadding,
                top: Constant.refineCustomTopPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(
                  title: Strings.selectYourAvailablity,
                  topPadding: Constant.refineTitleCustomTopPadding,
                  leftPadding: Constant.refineTitleCustomLeftPadding,
                  bottomPadding: Constant.refineTitleCustomBottomPadding,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: Constant.dropDownButtonLeftPadding,
                      right: Constant.dropDownButtonRightPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          Constant.dropDownButtonBorderCorner),
                      border: Border.all(
                          color: AppTheme.primaryColor
                              .withOpacity(Constant.customColorOpacity))),
                  child: DropdownButton<String>(
                      underline: Container(
                        height: Constant.customUnderlineHeight,
                        color: AppTheme.colorTransprant,
                      ),
                      isExpanded: true,
                      value: valuez,
                      items: item.map((itemBuilder)).toList(),
                      onChanged: (value) {
                        setState(() {
                          valuez = value!;
                        });
                      }),
                ),
                title(
                  title: Strings.addYourStatus,
                  topPadding: Constant.refineTitleCustomTopPadding,
                  leftPadding: Constant.refineTitleCustomLeftPadding,
                  bottomPadding: Constant.refineTitleCustomBottomPadding,
                ),
                CustomTextFeild(
                  controller: controller,
                  leftPadding: Constant.zero,
                  rightPadding: Constant.zero,
                  topPadding: Constant.zero,
                ),
                title(
                  title: Strings.selectHyperLocalDistance,
                  topPadding: Constant.selectHyperLocalDistanceTopPadding,
                  leftPadding: Constant.selectHyperLocalDistanceLeftPadding,
                  bottomPadding: Constant.selectHyperLocalDistanceBottomPadding,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Constant.sliderPadding, right: Constant.sliderPadding),
            child: SliderTheme(
              data: SliderThemeData(
                valueIndicatorColor: AppTheme.primaryColor,
                trackHeight: Constant.sliderTrackHeight,
              ),
              child: Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                child: Slider(
                    value: valueHolder.toDouble(),
                    min: Constant.sliderMinValue,
                    max: Constant.sliderMaxValue,
                    divisions: Constant.sliderDivisionValue,
                    activeColor: AppTheme.primaryColor,
                    inactiveColor: AppTheme.colorGrey,
                    label: '${valueHolder.round()}',
                    onChanged: (double newValue) {
                      setState(() {
                        valueHolder = newValue.round();
                      });
                    },
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()}';
                    }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Constant.kmFontPadding, right: Constant.kmFontPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: Strings.oneKM,
                  fontfamily: Strings.emptyString,
                  color: AppTheme.primaryColor,
                  fontWight: FontWeight.w400,
                ),
                CustomText(
                  title: Strings.hundredKM,
                  fontfamily: Strings.emptyString,
                  fontWight: FontWeight.w400,
                  color: AppTheme.primaryColor,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Constant.refineCustomLeftPadding,
                right: Constant.refineCustomRightPadding,
                top: Constant.refineSelectPurposeTopPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(
                  title: Strings.selectPurpose,
                  topPadding: Constant.selectPurposeTopPadding,
                  leftPadding: Constant.selectPurposeLeftPadding,
                  bottomPadding: Constant.selectPurposeBottomPadding,
                ),
                Row(
                  children: [
                    labelChip(title: Strings.cofee),
                    labelChip(title: Strings.business_),
                    labelChip(title: Strings.hobbies)
                  ],
                ),
                Row(
                  children: [
                    labelChip(title: Strings.freindship),
                    labelChip(title: Strings.movies),
                    labelChip(title: Strings.dinning)
                  ],
                ),
                Row(
                  children: [
                    labelChip(title: Strings.dating),
                    labelChip(title: Strings.matrimony),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Constant.saveAndExploreChipTopPadding),
                      child: Container(
                        margin: const EdgeInsets.all(
                            Constant.saveAndExploreChipMargin),
                        padding: const EdgeInsets.only(
                            left: Constant.saveAndExploreChipContentLeftPadding,
                            right:
                                Constant.saveAndExploreChipContentRightPadding,
                            bottom:
                                Constant.saveAndExploreChipContentBottomPadding,
                            top: Constant.saveAndExploreChipContentTopPadding),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                Constant.saveAndExploreChipBorderCorner),
                            color: AppTheme.primaryColor),
                        child: CustomText(
                          title: Strings.saveAndExplore,
                          fontfamily: Strings.emptyString,
                          fontSize: Constant.saveAndExploreFontSize,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  int valueHolder = Constant.value;

  title(
      {double topPadding = Constant.zero,
      double leftPadding = Constant.zero,
      double bottomPadding = Constant.zero,
      double rightPadding = Constant.zero,
      required String title}) {
    return CustomText(
      topPadding: topPadding,
      leftPadding: leftPadding,
      bottomPadding: bottomPadding,
      rightPadding: rightPadding,
      title: title,
      color: AppTheme.primaryColor,
      fontfamily: Strings.emptyString,
      fontWight: FontWeight.w500,
    );
  }

  Widget labelChip({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: Constant.labelChipTopPadding),
      child: Container(
        margin: const EdgeInsets.all(Constant.labelChipMargin),
        padding: const EdgeInsets.only(
            left: Constant.labelChipContentLeftPadding,
            right: Constant.labelChipContentRightPadding,
            bottom: Constant.labelChipContentBottomPadding,
            top: Constant.labelChipContentTopPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Constant.labelChipBorderRadius),
            color: AppTheme.primaryColor),
        child: CustomText(
          title: title,
          fontfamily: Strings.emptyString,
          fontWight: FontWeight.w400,
          fontSize: Constant.labelChipFontSize,
        ),
      ),
    );
  }

  List<String> item = [
    Strings.availableHeyLetUsConnect,
    Strings.availableStayDiscreetAndWatch,
    Strings.busyDoNotDisturbWillCatchUpLater,
    Strings.sosEmergencyNeddAssistanceHelp
  ];
  String valuez = Strings.busyDoNotDisturbWillCatchUpLater;
  DropdownMenuItem<String> itemBuilder(String title) {
    return DropdownMenuItem(
        value: title,
        child: CustomText(
          title: title,
          fontSize: Constant.dropDownTextSize,
          fontfamily: Strings.emptyString,
          fontWight: FontWeight.w400,
          color: AppTheme.primaryColor,
        ));
  }
}
