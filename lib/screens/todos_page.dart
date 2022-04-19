import 'package:flutter/material.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/core/components/text_widget.dart';
import 'package:todosapp/core/constants/colors/mycolor.dart';
import 'package:todosapp/providers/db_provider.dart';
import 'package:todosapp/providers/ontap_provider.dart';
import 'package:todosapp/widgets/app_bar_widget.dart';
import 'package:todosapp/widgets/todo_list_widget.dart';
import 'package:todosapp/widgets/write_widget.dart';

// class ToDosPage extends StatefulWidget {
//   const ToDosPage({Key? key}) : super(key: key);

//   @override
//   State<ToDosPage> createState() => _ToDosPageState();
// }

class ToDosPage extends StatefulWidget {
  @override
  State<ToDosPage> createState() => _ToDosPageState();
}

class _ToDosPageState extends State<ToDosPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _moreController = TextEditingController();
  List<bool>? completed;
  
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<DbProvider>().readFromDb();
    context.read<DbProvider>().gener();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            AppBarWidget(),
            Expanded(
              flex: context.watch<OnTapProvider>().onTap == false ? 0 : 3,
              child: WriteWidget(),
    //           child: Stack(
    //   children: [
    //     Container(
    //       padding: EdgeInsets.all(20),
    //       height: context.watch<OnTapProvider>().onTap == false ? 0 : 300,
    //       color: Colors.white,
    //       child: Container(
    //         padding: EdgeInsets.all(10),
    //         decoration: BoxDecoration(
    //             // color: ColorConst.kPrimaryColorWhite,
    //             color: ColorConst.kCloudColor,
    //             borderRadius: BorderRadius.circular(15)),
    //         child: SingleChildScrollView(
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 controller: _titleController,
    //                 keyboardType: TextInputType.multiline,
    //                 maxLines: 5,
    //                 minLines: 1,
    //                 cursorColor: ColorConst.kPrimaryColor,
    //                 cursorRadius: Radius.circular(10),
    //                 decoration: InputDecoration(
    //                     hintText: "Title",
    //                     hintStyle: TextStyle(
    //                         color: ColorConst.kPrimaryColor, fontSize: 25),
    //                     border: InputBorder.none),
    //               ),
    //               TextFormField(
    //                 controller: _moreController,
    //                 keyboardType: TextInputType.multiline,
    //                 maxLines: 200,
    //                 minLines: 1,
    //                 cursorColor: ColorConst.kPrimaryColor,
    //                 cursorRadius: Radius.circular(10),
    //                 decoration: InputDecoration(
    //                     hintText: "Write More (optional)",
    //                     hintStyle: TextStyle(
    //                         color: ColorConst.kPrimaryColor, fontSize: 18),
    //                     border: InputBorder.none),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //       // bottom: 0,
    //       child: Container(
    //         width: MediaQuery.of(context).size.width,
    //         alignment: Alignment.bottomCenter,
    //         child: InkWell(
    //           child: CircleAvatar(
    //             radius: context.watch<OnTapProvider>().onTap == false ? 0 : 25,
    //             backgroundColor: ColorConst.kSuccessColor,
    //             child: Icon(
    //               Icons.check_rounded,
    //               color: ColorConst.kWhite,
    //             ),
    //           ),
    //           onTap: () async {
    //             await context
    //                 .read<DbProvider>()
    //                 .writeToDb(_titleController.text, _moreController.text);
    //             context.read<DbProvider>().readFromDb();
    //               context.read<DbProvider>().gener();
    //             // setState(() {      
    //             // });
    //             context.read<OnTapProvider>().onTapped();
    //           },
    //         ),
    //       ),
    //     ),
    //   ],
    // )
            ),
            Expanded(
              flex: 7,
              child: ToDoListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}





// ElevatedButton(
//   child: Text("Check"),
//   onPressed: () {
//     context.read<DbProvider>().readFromDb();
//   },
// ),
// ElevatedButton(
//   child: Text("uodate"),
//   onPressed: () async {
//     await context.read<DbProvider>().readFromDb();
//     context.read<DbProvider>().updateDb();
//   },
// ),
