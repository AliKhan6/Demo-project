import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../custom_widgets/bottom_nav_bar/fab_bar.dart';
import '../../custom_widgets/image_container.dart';
import 'root_screen_view_model.dart';

class RootScreen extends StatelessWidget {
  //Todo: Do localizaiton here.
  @override
  Widget build(BuildContext context) {
    return Consumer<RootScreenViewModel>(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          final status = await Get.dialog(AlertDialog(
            title: const Text('Caution!'),
            content: const Text('Do you really want to close the application?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.back(result: true);
                },
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: false);
                },
                child: const Text('No'),
              ),
            ],
          ));

          /// In case user has choosen not to be kept logged in,
          /// he will get logged out of the app on exit.
          // if (status && !locator<AuthService>().isRemeberMe) {
          //   await locator<AuthService>().logout();
          // }
          return status;
        },
        child: Scaffold(
          extendBody: true,
          body: model.allScreen[model.selectedScreen],

          bottomNavigationBar: model.isEnableBottomBar
              ? FABBottomAppBar(
                  color: Colors.grey,
                  backgroundColor: Colors.grey,
                  selectedColor: primaryColor,
                  notchedShape: const CircularNotchedRectangle(),
                  onTabSelected: model.updatedScreenIndex,
                  items: [
                    FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 30.h,
                        width: 30.h,
                        assets: "${staticAssets}bottom_home_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 30.h,
                        width: 30.h,
                        assets: "${staticAssets}bottom_card_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 30.h,
                        width: 30.h,
                        assets: "${staticAssets}bottom_category_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    FABBottomAppBarItem(
                      icon: ImageContainer(
                        height: 30.h,
                        width: 30.h,
                        assets: "${staticAssets}bottom_profile_icon.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              : Container(),
//      body: _list[_page],
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: model.isEnableBottomBar
              ? FloatingActionButton(
                  backgroundColor: otherColor,
                  onPressed: () {},
                  child: Icon(Icons.add),
                  elevation: 2.0,
                )
              : Container(),
        ),
      ),
    );
  }
}
