import 'package:beside04_data_manager/di/getx_binding.dart';
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
        if (controller.menu.isActive) {
          controller.menu.removeMenu();
        }
      },
      child: Scaffold(
        body: Center(
          child: Obx(
            () => state.value.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: 1100,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...state.value.emoticons
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              e.emoticon,
                                            ),
                                            Text(
                                              e.description.join(', '),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('저장'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                controller.menu.showMenu(
                                                  state.value.wiseSayings,
                                                );
                                              },
                                              child: const Text('명언 선택'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                width: 450,
                                                height: 200,
                                                padding:
                                                    const EdgeInsets.all(12),
                                                decoration: const BoxDecoration(
                                                    color: Colors.amber),
                                                child: const Text('1'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 200,
                                              height: 60,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Expanded(
                                                      child: TextField()),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: const Text('단어 추가'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Container(
                                                width: 300,
                                                height: 140,
                                                padding:
                                                    const EdgeInsets.all(12),
                                                decoration: const BoxDecoration(
                                                    color: Colors.amber),
                                                child: const Text('1'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
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
    );
  }
}
