import 'package:flutter/material.dart';
import 'package:todosapp/core/components/text_widget.dart';
import 'package:todosapp/core/constants/colors/mycolor.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.kCloudColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover),
                  ),
                  child: const SizedBox(),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 80.0,
                        ),
                        TextWidget.textWidget(
                            text: "Start enjoying a more organized life",
                            size: 40.0,
                            color: ColorConst.kPrimaryColor,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: 30,
                        ),
                        TextWidget.textWidget(
                            text:
                                "Plan, organize, track, in one visual, collaborative space",
                            color: ColorConst.kPrimaryColor),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          child: TextWidget.textWidget(
                              text: "Get Started", color: ColorConst.kWhite),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: ColorConst.kPrimaryColor,
                              fixedSize: Size(183, 55)),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/');
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 220,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child:
                    Image.asset('assets/images/illustration.png', width: 200),
              ),
            ),
          )
        ],
      ),
    );
  }
}
