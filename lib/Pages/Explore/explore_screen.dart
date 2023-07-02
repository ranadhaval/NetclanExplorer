// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:netclan_explore/Pages/Explore/explore_controller.dart';
import 'package:netclan_explore/routes/app_routes.dart';
import 'package:netclan_explore/theme/app_theme.dart';
import 'package:netclan_explore/util/_string.dart';
import 'package:netclan_explore/util/constants.dart';
import 'package:netclan_explore/util/resources.dart';
import 'package:netclan_explore/widgets/custom_text.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  final exploreController = Get.put(ExploreController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: exploreController,
        builder: (_) {
          return DefaultTabController(
            length: Constant.INT_THREE,
            child: Scaffold(
                floatingActionButton: SizedBox(
                  height: Constant.floatingButtonSize,
                  width: Constant.floatingButtonSize,
                  child: FloatingActionButton(
                    backgroundColor: AppTheme.primaryColor,
                    onPressed: () {},
                    child: const Icon(
                      Icons.add,
                      size: Constant.floatingButtonAddIconSize,
                    ),
                  ),
                ),
                appBar: AppBar(
                  elevation: 1,
                  backgroundColor: AppTheme.colorPrimaryTheme,
                  automaticallyImplyLeading: Constant.isFalse,
                  actions: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.REFINE);
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.all(Constant.checklistIconPadding),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.checklist_outlined,
                              size: Constant.checklistIconSize,
                            ),
                            CustomText(
                              topPadding: Constant.refineTextToppadding,
                              title: Strings.refine,
                              fontSize: Constant.refineTextSize,
                              fontfamily: Strings.emptyString,
                              fontWight: FontWeight.bold,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: Constant.menuIconPadding),
                      child: SvgPicture.asset(
                        menu,
                        color: AppTheme.colorWhite,
                      ),
                    ),
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        leftPadding: Constant.appbarUsernamePadding,
                        title: Strings.howdyDhavalRana,
                        fontfamily: Strings.emptyString,
                        fontSize: Constant.appbarUsernameSizePadding,
                        fontWight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: Constant.appbarlocationIconSize,
                          ),
                          CustomText(
                            height: Constant.appbarSubtitleHeight,
                            leftPadding: Constant.appbarsubtitleleftPadding,
                            title: Strings.bahmanpithDholka,
                            fontfamily: Strings.bahmanpithDholka,
                            fontSize: Constant.appbarsubtitleSize,
                            fontWight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                body: _body()),
          );
        });
  }

  _body() {
    return Column(
      children: [
        Container(
          color:
              AppTheme.colorPrimaryTheme.withOpacity(Constant.tabColorOpacity),
          height: Constant.tabContainerHeight,
          child: TabBar(
              controller: exploreController.tabController,
              indicatorWeight: Constant.TWO,
              indicatorColor: AppTheme.colorWhite,
              indicatorPadding:
                  const EdgeInsets.only(top: Constant.tabIdicatorPadding),
              tabs: [
                CustomText(
                  title: Strings.personal,
                  fontfamily: Strings.emptyString,
                  fontSize: Constant.tabTextSize,
                  fontWight: FontWeight.bold,
                ),
                CustomText(
                  title: Strings.business,
                  fontfamily: Strings.emptyString,
                  fontSize: Constant.tabTextSize,
                  fontWight: FontWeight.bold,
                ),
                CustomText(
                  title: Strings.merchant,
                  fontfamily: Strings.emptyString,
                  fontSize: Constant.tabTextSize,
                  fontWight: FontWeight.bold,
                ),
              ]),
        ),
        Expanded(
          child: TabBarView(
              controller: exploreController.tabController,
              children: [
                _tabBarbody(
                  image: [
                    Strings.personalImage1,
                    Strings.personalImage2,
                    Strings.personalImage3,
                    Strings.personalImage4
                  ],
                ),
                _tabBarbody(image: [
                  Strings.businessImage1,
                  Strings.businessImage2,
                  Strings.businessImage3,
                  Strings.businessImage4
                ]),
                _tabBarbody(image: [
                  Strings.merchantImage1,
                  Strings.merchantImage2,
                  Strings.merchantImage3,
                  Strings.merchantImage4
                ], isMerchant: true),
              ]),
        )
      ],
    );
  }

  @override
  void initState() {
    exploreController.tabController =
        TabController(length: Constant.INT_THREE, vsync: this);
    exploreController.update();
    super.initState();
  }

  _tabBarbody({required List<String> image, bool isMerchant = false}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: Constant.searchFieldTopPadding,
                    left: Constant.searchFieldLeftPadding,
                    bottom: Constant.searchFieldRightPadding),
                child: SizedBox(
                  height: Constant.searchFieldHeight,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? Strings.invalidInput : null,
                    decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding:
                              const EdgeInsets.all(Constant.searchIconPadding),
                          child: SvgPicture.asset(
                            search,
                            height: Constant.searchIconHeight,
                            width: Constant.searchIconWidth,
                          ),
                        ),
                        hintText: Strings.search,
                        hintStyle: const TextStyle(
                            color: AppTheme.colorblack38,
                            fontSize: Constant.searchTextSize),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                Constant.searchFieldCorner)),
                        contentPadding: const EdgeInsets.only(
                            top: Constant.searchFieldContentTopPadding,
                            right: Constant.searchFieldContentRightPadding,
                            left: Constant.searchFieldContentLeftPadding,
                            bottom: Constant.searchFieldContentBottomPadding),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                Constant.searchFieldCorner)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                Constant.searchFieldCorner))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: Constant.filterIconLeftPadding,
                    top: Constant.filterIconTopPadding),
                child: SvgPicture.asset(
                  filter,
                  width: Constant.filterIconWidth,
                  height: Constant.filterIconHeight,
                  color: AppTheme.colorPrimaryTheme,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: image.length,
              itemBuilder: (context, index) {
                return tile(image: image[index], isMerchant: isMerchant);
              },
            ),
          )
        ],
      ),
    );
  }

  tile({required String image, required bool isMerchant}) {
    return Padding(
      padding: const EdgeInsets.only(
        top: Constant.serviceTileTopPadding,
        bottom: Constant.serviceTileLeftPadding,
        right: Constant.serviceTileRightPadding,
        left: Constant.serviceTileBottomPadding,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / Constant.serviceTileHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.serviceTileBorderCorner),
          color: AppTheme.colorTransprant,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: Constant.serviceTileSecondLeftPadding),
              child: Container(
                height: MediaQuery.of(context).size.height /
                    Constant.serviceTileSecondHeight,
                width: MediaQuery.of(context).size.width /
                    Constant.serviceTileSecondWidth,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        Constant.serviceTileSecondBorderCorner),
                    color: AppTheme.colorWhite,
                    boxShadow: [
                      Constant.boxShadow(color: AppTheme.colorblack)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Constant.serviceTileContentPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          isMerchant
                              ? Container()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          bottom:
                                              Constant.addIconBottomPadding),
                                      child: Icon(
                                        Icons.add,
                                        size: Constant.addIconSize,
                                      ),
                                    ),
                                    CustomText(
                                      topPadding: Constant.inviteTopPadding,
                                      rightPadding: Constant.inviteRightPadding,
                                      bottomPadding:
                                          Constant.inviteBottomPadding,
                                      title: Strings.invite,
                                      color: AppTheme.primaryColor,
                                      fontWight: FontWeight.bold,
                                      fontfamily: Strings.emptyString,
                                    ),
                                  ],
                                ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: Strings.ambulanceService,
                                color: AppTheme.primaryColor,
                                fontfamily: Strings.emptyString,
                                fontSize: Constant.serviceTileTitleSize,
                                wordSpacing:
                                    Constant.serviceTileTitleWordSpacing,
                                fontWight: FontWeight.bold,
                              ),
                              CustomText(
                                height: Constant.serviceTileSubTitleHeight,
                                title: Strings.bavlaWithinKm,
                                color: AppTheme.primaryColor,
                                fontfamily: Strings.emptyString,
                                fontSize: Constant.serviceTileSubTitleSize,
                                wordSpacing:
                                    Constant.serviceTileSubTitleWordSpacing,
                                fontWight: FontWeight.w300,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width *
                                      Constant.serviceTileIndicatorWidth,
                                  height: MediaQuery.of(context).size.height *
                                      Constant.serviceTileIndicatorHeight,
                                  margin: const EdgeInsets.only(
                                      top: Constant
                                          .serviceTileIndicatorTopPadding),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(Constant
                                            .serviceTileIndicatorBorderCorner)),
                                    child: LinearProgressIndicator(
                                      minHeight: Constant
                                          .serviceTileIndicatorMinHeight,
                                      value: 0.6,
                                      color: AppTheme.primaryColor,
                                      backgroundColor:
                                          AppTheme.colorGrey.withOpacity(0.4),
                                    ),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Constant.serviceTileIconLeftPadding,
                                    top: Constant.serviceTileIconTopPadding),
                                child: Row(
                                  children: [
                                    serviceTileIcon(
                                      icons: Icons.call,
                                    ),
                                    serviceTileIcon(
                                      icons: Icons.person_add_alt_1,
                                    ),
                                    serviceTileIcon(
                                      icons: Icons.location_on,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: Constant.serviceTileDiscriptionLeftPadding,
                          right: Constant.serviceTileDiscriptionRightPadding,
                          top: Constant.serviceTileDiscriptionTopPadding,
                          bottom: Constant.serviceTileDiscriptionBottomPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: Strings.hiCommunityWeHaveGreateDeals,
                            color: AppTheme.primaryColor,
                            fontfamily: Strings.emptyString,
                            fontSize: Constant.serviceTileDiscriptionSize,
                            height: Constant.serviceTileDiscriptionHeight,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: Constant.serviceTileImageTopPadding),
                    child: Container(
                      height: Constant.serviceTileImageHeight,
                      width: Constant.serviceTileImageWidth,
                      decoration: BoxDecoration(
                          color: AppTheme.colorGrey,
                          borderRadius: BorderRadius.circular(
                              Constant.serviceTileImageBorderCorner),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image))),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  serviceTileIcon({required IconData icons}) {
    return Container(
        height: Constant.serviceTileIconHeight,
        width: Constant.serviceTileIconWidth,
        margin:
            const EdgeInsets.only(right: Constant.serviceTileIconRightMargin),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(Constant.serviceTileIconBorderCorner),
          color: AppTheme.primaryColor,
        ),
        child: Icon(
          icons,
          color: AppTheme.colorWhite,
        ));
  }
}
