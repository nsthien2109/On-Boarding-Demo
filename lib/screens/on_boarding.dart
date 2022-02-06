import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding_custom/data/data_onboarding.dart';
import 'package:onboarding_custom/screens/home.dart';
import 'package:onboarding_custom/sharepreferences/share_pref.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({ Key? key }) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

final List<OnBoardingModel> onboards = [
  OnBoardingModel(title: "Welcome to application", image: 'assets/images/ob1.svg', subTitle: 'subTitle'),
  OnBoardingModel(title: "In here we provider for you everything", image: 'assets/images/ob2.svg', subTitle: 'subTitle'),
  OnBoardingModel(title: "Just only you want", image: 'assets/images/ob3.svg', subTitle: 'subTitle'),
];

class _OnBoardingState extends State<OnBoarding> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          isLastPage ? Container() : TextButton(onPressed: (){
            controller.jumpToPage(2);
          }, child: const Text('Skip'))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 70),
        child: PageView.builder(
          controller: controller,
          onPageChanged: (index){
              setState(() {
                isLastPage = index == 2;
              });
          },
          itemCount: 3,
          itemBuilder: (_,index) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(onboards[index].title,style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),textAlign: TextAlign.center),
                const SizedBox(height: 30),
                SvgPicture.asset(
                  onboards[index].image,
                  width: 350,
                ),
                const SizedBox(height: 30),
                Text(onboards[index].subTitle,textAlign: TextAlign.center,style: const TextStyle(fontSize: 15))
              ],
            )
          )
        ),
      ),
      bottomSheet: isLastPage == false ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              controller.previousPage(duration: const Duration(microseconds: 700), curve: Curves.easeInQuart);
            }, child: const Text("Previous")),
            SmoothPageIndicator(  
              controller: controller,  
              count:  3,  
              axisDirection: Axis.horizontal,  
              effect: const SlideEffect(  
                  spacing:  8.0,  
                  radius:  5.0,  
                  dotWidth:  13.0,  
                  dotHeight:  13.0,  
                  paintStyle:  PaintingStyle.stroke,  
                  strokeWidth:  1,  
                  dotColor:  Colors.pink,  
                  activeDotColor:  Colors.pinkAccent  
              ),  
            ),  
  
            TextButton(onPressed: (){
              controller.nextPage(duration: const Duration(microseconds: 700), curve: Curves.easeInQuart);
            }, child:  const Text("Next"))
          ],
        ),
      ) : SizedBox(
        height: 70,
        child: TextButton(
          child: const Text("Get Started"),
          onPressed: () async {
            await showHome('showHome', true);
            Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: const HomeScreen()));
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.pink[400],
            alignment: Alignment.center,
            minimumSize: const Size(double.infinity, 70),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
            )
          ),
        ),
      ),
    );
  }
}