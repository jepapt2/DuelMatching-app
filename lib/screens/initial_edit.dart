import 'package:duel_matching/freezed/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class InitialEditScreen extends HookWidget {
  const InitialEditScreen({Key? key, this.query}) : super(key: key);

  final String? query;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    final Size mediaSize = MediaQuery.of(context).size;
    final pageState = useState(0);
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: mediaSize.height / 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
              visible: pageState.value != 0,
              child: FloatingActionButton(
                  child: const Icon(
                    Icons.arrow_back,
                    color: Color(0xfffffffe),
                    size: 30,
                  ),
                  onPressed: () {
                    pageState.value--;
                    controller.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.linear);
                  }),
            ),
            const SizedBox(width: 15),
            FloatingActionButton(
                child: const Icon(
                  Icons.arrow_forward,
                  color: Color(0xfffffffe),
                  size: 30,
                ),
                onPressed: () {
                  pageState.value++;
                  controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.linear);
                }),
          ],
        ),
      ),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Center(child: Text('1')),
          ),
          Container(
            child: Center(child: Text('2')),
          ),
          Container(
            child: Center(child: Text('3')),
          ),
        ],
      ),
    );
  }
}
