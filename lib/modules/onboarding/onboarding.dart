import 'package:flutter/material.dart';
import 'package:hiring_app/components/colors.dart';
import 'package:hiring_app/components/components.dart';
import 'package:hiring_app/models/boarding_model.dart';
import 'package:hiring_app/modules/who_are_you_screen.dart';
import 'package:hiring_app/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveDate(key: 'onBoarding', value: true,);
    navigateAndFinish(context, WhoAreYouScreen());
  }

  List<BoardingModel> boardingItems = [];

  @override
  Widget build(BuildContext context) {
    boardingItems = [
      BoardingModel(
        image: 'assets/images/screen2.png',
        title:
            'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      ),
      BoardingModel(
        image: 'assets/images/screen3.png',
        title:
            'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      ),
      BoardingModel(
        image: 'assets/images/screen1.png',
        title:
            'Lorem dolor sit amet consectetur adipisicing elit, sed do eiusmod tempor incididunt ut ero labore et dolore',
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (pageCount) {
                  if (pageCount == boardingItems.length - 1) {
                    setState(() => isLast = true);
                  } else {
                    setState(() => isLast = false);
                  }
                },
                itemCount: boardingItems.length,
                physics: BouncingScrollPhysics(),
                controller: boardingController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boardingItems[index]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      submit();
                    },
                    child: Text('SKIP')),
                SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotHeight: 5,
                    dotWidth: 6,
                    spacing: 5,
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                  ),
                  controller: boardingController,
                  count: boardingItems.length,
                ),
                TextButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardingController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Text('NEXT')),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     if (isLast) {
      //       // submit();
      //     } else {
      //       boardingController.nextPage(
      //           duration: Duration(milliseconds: 750),
      //           curve: Curves.fastLinearToSlowEaseIn);
      //     }
      //   },
      //   child: Text(
      //     'NEXT',
      //     style: TextStyle(color: defaultColor),
      //   ),
      // ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset('${model.image}')),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 18,
              color: defaultColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
