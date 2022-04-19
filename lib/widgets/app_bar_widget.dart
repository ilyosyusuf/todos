import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/core/components/text_widget.dart';
import 'package:todosapp/core/constants/colors/mycolor.dart';
import 'package:todosapp/providers/ontap_provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              alignment: Alignment.center,
              color: ColorConst.kCloudColor,
              child: ListTile(
                leading: Image.asset('assets/images/doc.png', width: 35),
                title: TextWidget.textWidget(
                    text: "InBox",
                    size: 25,
                    fontWeight: FontWeight.bold,
                    color: ColorConst.kPrimaryColor),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit_note_rounded,
                    size: 35,
                    color: ColorConst.kPrimaryColor,
                  ),
                  onPressed: () {
                    context.read<OnTapProvider>().onTapped();
                  },
                ),
              ),
            );
  }
}