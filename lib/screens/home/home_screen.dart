import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_textstyles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';

import '../../configs/themes/app_icons.dart';
import '../../controllers/question_paper/question_paper_controller.dart';
import '../../widgets/app_circle_button.dart';
import '../../widgets/content_area.dart';

class HomeScreen extends GetView<MyzoomDrawerController> {
  HomeScreen({super.key});
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyzoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          //menuBackgroundColor: mainGradient(context),
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          borderRadius: 50,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0,
          style: DrawerStyle.DefaultStyle,
          menuScreen: MenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient(context)),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.toggleDrawer,
                          child: Icon(
                            AppIcons.menuLeft,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Icon(
                                AppIcons.peace,
                              ),
                              Text(
                                'Hello Friend',
                                style: detailText.copyWith(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Text(
                          'What do you want to learn today?',
                          style: headerText.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 8, right: 8, bottom: mobileScreenPadding),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() => ListView.separated(
                            padding: UIParameters.mobileScreenPadding,
                            itemBuilder: (BuildContext context, int index) {
                              return QuestionCard(
                                  model: _questionPaperController
                                      .allpapers[index]);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                            itemCount:
                                _questionPaperController.allpapers.length)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
