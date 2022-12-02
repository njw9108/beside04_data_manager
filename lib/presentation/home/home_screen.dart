import 'package:beside04_data_manager/di/getx_binding.dart';
import 'package:beside04_data_manager/presentation/home/components/matching/matching_widget.dart';
import 'package:beside04_data_manager/presentation/home/components/pagination/pagination_widget.dart';
import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeViewModel> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getHomeBinding(context);
    final state = controller.state;

    return GestureDetector(
      onTap: () {
        if (controller.emoticonMenu.isActive) {
          controller.emoticonMenu.removeMenu();
        }
        if (controller.wordMenu.isActive) {
          controller.wordMenu.removeMenu();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.limeAccent,
          toolbarHeight: 100,
          flexibleSpace: const Padding(
            padding: EdgeInsets.all(8),
            child: Center(
              child: PaginationWidget(),
            ),
          ),
        ),
        body: Center(
          child: Obx(
            () => state.value.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: 1100,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Obx(
                          () => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ...state.value.matchingList
                                  .map(
                                    (matchingData) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: MatchingWidget(
                                        matchingData: matchingData,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
