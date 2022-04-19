import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/core/constants/colors/mycolor.dart';
import 'package:todosapp/providers/db_provider.dart';
import 'package:todosapp/providers/ontap_provider.dart';

class WriteWidget extends StatefulWidget {
  const WriteWidget({Key? key}) : super(key: key);

  @override
  State<WriteWidget> createState() => _WriteWidgetState();
}

class _WriteWidgetState extends State<WriteWidget> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _moreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          height: context.watch<OnTapProvider>().onTap == false ? 0 : 300,
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: ColorConst.kCloudColor,
                borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      cursorColor: ColorConst.kPrimaryColor,
                      cursorRadius: const Radius.circular(10),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                              color: ColorConst.kPrimaryColor, fontSize: 25),
                          border: InputBorder.none),
                      validator: (v) {
                        if (v!.isEmpty) {
                          showSnackBar("Please fill the line", Colors.red);
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _moreController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 200,
                      minLines: 1,
                      cursorColor: ColorConst.kPrimaryColor,
                      cursorRadius: const Radius.circular(10),
                      decoration: InputDecoration(
                          hintText: "Write More (optional)",
                          hintStyle: TextStyle(
                              color: ColorConst.kPrimaryColor, fontSize: 18),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: InkWell(
              child: CircleAvatar(
                radius: context.watch<OnTapProvider>().onTap == false ? 0 : 25,
                backgroundColor: ColorConst.kSuccessColor,
                child: Icon(
                  Icons.check_rounded,
                  color: ColorConst.kWhite,
                ),
              ),
              onTap: () async {
                await context
                    .read<DbProvider>()
                    .writeToDb(_titleController.text, _moreController.text);
                context.read<DbProvider>().readFromDb();
                context.read<DbProvider>().gener();
                _titleController.clear();
                _moreController.clear();
                context.read<OnTapProvider>().onTapped();
              },
            ),
          ),
        ),
      ],
    );
  }

  showSnackBar(String content, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: color,
      ),
    );
  }
}
