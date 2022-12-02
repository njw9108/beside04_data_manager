import 'package:beside04_data_manager/presentation/home/home_view_model.dart';
import 'package:beside04_data_manager/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeViewModel>();
    final state = controller.state;

    return Responsive.isDesktop(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await controller.setPage(1);
                },
                child: const Text('첫 페이지'),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.getPrevPage();
                  },
                  child: const Text('이전')),
              const SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: controller.curPageController,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await controller.setPage(
                      int.parse(controller.curPageController.text),
                    );
                  },
                  child: const Text('이동')),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.getNextPage();
                },
                child: const Text('다음'),
              ),
              const SizedBox(
                width: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.setPage(state.value.totalPage + 1);
                },
                child: const Text('마지막 페이지'),
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await controller.setPage(1);
                      },
                      child: const Text('첫 페이지'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.setPage(state.value.totalPage + 1);
                      },
                      child: const Text('마지막 페이지'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          await controller.getPrevPage();
                        },
                        child: const Text('이전')),
                    const SizedBox(
                      width: 40,
                    ),
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: controller.curPageController,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          await controller.setPage(
                            int.parse(controller.curPageController.text),
                          );
                        },
                        child: const Text('이동')),
                    const SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await controller.getNextPage();
                      },
                      child: const Text('다음'),
                    ),
                  ],
                ),
              )
            ],
          );
  }
}
