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
        if (controller.wordMenu.isActive) {
          controller.wordMenu.removeMenu();
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
                                    (matchingData) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            matchingData.wiseSaying,
                                            style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              backgroundColor: Colors.amber,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          ...matchingData.emoticonWordsList.map(
                                            (emoticonWordsData) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 80,
                                                      height: 80,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.greenAccent,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () {
                                                          controller
                                                              .emoticonMenu
                                                              .showMenu(
                                                            state.value
                                                                .emoticons,
                                                            (emoticon) {
                                                              controller.setEmoticon(
                                                                  matchingData,
                                                                  emoticonWordsData,
                                                                  emoticon);
                                                            },
                                                          );
                                                        },
                                                        child: emoticonWordsData
                                                                .emoticon
                                                                .isEmpty
                                                            ? const Center(
                                                                child: Text(
                                                                  '이모티콘 선택',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              )
                                                            : Image.asset(
                                                                emoticonWordsData
                                                                    .emoticon,
                                                              ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                      width: 500,
                                                      height: 220,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      decoration:
                                                          const BoxDecoration(
                                                        color:
                                                            Colors.cyanAccent,
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {
                                                                controller
                                                                    .wordMenu
                                                                    .showMenu(
                                                                  (words) {
                                                                    controller.addWords(
                                                                        matchingData,
                                                                        emoticonWordsData,
                                                                        words);
                                                                  },
                                                                );
                                                              },
                                                              child: const Text(
                                                                  '단어 추가'),
                                                            ),
                                                            GridView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    emoticonWordsData
                                                                        .words
                                                                        .length,
                                                                gridDelegate:
                                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      3,
                                                                  //1 개의 행에 보여줄 item 개수
                                                                  childAspectRatio:
                                                                      2 / 1,
                                                                  //가로 세로 비율
                                                                  mainAxisSpacing:
                                                                      10,
                                                                  //수평 Padding
                                                                  crossAxisSpacing:
                                                                      10, //수직 Padding
                                                                ),
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .symmetric(
                                                                        vertical:
                                                                            8.0),
                                                                    child:
                                                                        Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                              color: Colors.amber),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            flex:
                                                                                3,
                                                                            child:
                                                                                Text(
                                                                              emoticonWordsData.words[index],
                                                                              maxLines: 2,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ).toList(),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.center,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  controller.addEmoticonWords(
                                                      matchingData);
                                                },
                                                child: Text('이모티콘 추가'),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Container(
                                              height: 1,
                                              color: Colors.black,
                                            ),
                                          )
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
