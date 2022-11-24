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
        if (controller.emoticonMenu.isActive) {
          controller.emoticonMenu.removeMenu();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
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
                            children: [
                              ...state.value.matchingList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.wiseSaying,
                                            style:
                                                const TextStyle(fontSize: 20),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(
                                                  color: Colors.greenAccent,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.emoticonMenu
                                                        .showMenu(
                                                      state.value.emoticons,
                                                      (emoticon) {
                                                        controller.setEmoticon(
                                                            e, emoticon);
                                                      },
                                                    );
                                                  },
                                                  child: e.emoticon.isEmpty
                                                      ? const Center(
                                                          child: Text(
                                                            '이모티콘 선택',
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )
                                                      : Image.asset(
                                                          e.emoticon,
                                                        ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              const SizedBox(
                                                  width: 200,
                                                  child: TextField()),
                                              ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('단어 추가'),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              Container(
                                                width: 500,
                                                height: 200,
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: const BoxDecoration(
                                                  color: Colors.greenAccent,
                                                ),
                                                child: Text(''),
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
      ),
    );
  }
}
