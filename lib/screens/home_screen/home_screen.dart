import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home_screen/homescreen_resources.dart';
import '../../resources/resources.dart';
import 'package:ecommerce/resources/import_resources.dart';
import '../reuse_widget/rich_text.dart';
import '../reuse_widget/text_design.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final userPreferences = UserPreferences();
  bool icon = true;
  final pages = [
    const HomeScreen(),
    const ShoppingCart(),
    const WishList(),
    UserAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          body: Consumer<BottumNavigation>(builder: (context, value, child) {
            return pages[value.selected];
          }),
          bottomNavigationBar: Container(
            height: 75,
            decoration: BoxDecoration(
                color: RGBColorManager.rgbWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.greyOpacityColor,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottumTabButton(
                    inDex: 0,
                    onSelectImageAsset: IconsAssets.homeLogo,
                    notSelectImageAsset: IconsAssets.homeUnfilledLogo),
                BottumTabButton(
                    inDex: 1,
                    onSelectImageAsset: IconsAssets.cartLogo,
                    notSelectImageAsset: IconsAssets.cartUnfilledLogo),
                BottumTabButton(
                  inDex: 2,
                  onSelectImageAsset: IconsAssets.wishListLogo,
                  notSelectImageAsset: IconsAssets.wishListUnfilledLogo,
                ),
                BottumTabButton(
                  inDex: 3,
                  onSelectImageAsset: IconsAssets.userLogo,
                  notSelectImageAsset: IconsAssets.userUnfilledLogo,
                ),
              ],
            ),
          )),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0).r,
      child: Container(
        margin: const EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IcnButton(
                        onPressed: () {
                          debugPrint("dashBoard");
                        },
                        iconSize: 45,
                        child: Image.asset(IconsAssets.dashboardLogo)),
                    IcnButton(
                        iconSize: 45,
                        onPressed: () {
                          debugPrint("User Profile");
                          Get.toNamed("/UserProfile");
                        },
                        child: CrcleAvatar(
                          color: RGBColorManager.rgbWhiteColor,
                          radius: 45,
                          child: Image.asset(IconsAssets.userLogo),
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20).r,
                  child: RichTxt(
                      text_1: "Welcome\n",
                      text_2: "Our Fashions App",
                      textSize_1: 35,
                      textSize_2: 25),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 280.0.w,
                        height: 45.0.h,
                        decoration: BoxDecoration(
                            color: RGBColorManager.rgbWhiteColor,
                            borderRadius: BorderRadius.circular(20.w)),
                        child: Row(
                          children: [
                            IcnButton(
                                onPressed: () {
                                  debugPrint("search icon");
                                },
                                iconSize: 0,
                                child: SizedBox(
                                  height: 25,
                                  child: Image.asset(
                                    IconsAssets.searchLogo,
                                  ),
                                )),
                            Expanded(
                              child: TextFormField(
                                controller: null,
                                cursorHeight: 24,
                                cursorRadius: const Radius.circular(10).w,
                                cursorColor: ColorManager.blackColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 11).r,
                                  hintText: "Search",
                                  // border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      IcnButton(
                          iconSize: 0,
                          onPressed: () {
                            Get.toNamed("/FilterScreen");
                          },
                          child: CrcleAvatar(
                            radius: 23,
                            color: ColorManager.blackColor,
                            child: Image.asset(
                              IconsAssets.filterLogo,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
            DesignText(
                fontSize: 20,
                text: "Categories",
                color: ColorManager.blackColor),
            Padding(
              padding: const EdgeInsets.only(top: 8).r,
              child: SizedBox(
                height: 25.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductCategory().category.length,
                  itemBuilder: (BuildContext context, index) {
                    return CategoryButton(
                      label: ProductCategory().category[index],
                      index: index,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DesignText(
                    fontSize: 18,
                    text: "TopDress",
                    color: ColorManager.blackColor),
                DesignText(
                    fontSize: 12,
                    text: "View all",
                    color: ColorManager.darkGreyColor),
              ],
            ),
            Expanded(
              child: AllProduct(),
            )
          ],
        ),
      ),
    );
  }
}


