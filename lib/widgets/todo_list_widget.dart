import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/core/components/text_widget.dart';
import 'package:todosapp/core/constants/colors/mycolor.dart';
import 'package:todosapp/providers/db_provider.dart';

class ToDoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: context.watch<DbProvider>().allDatas.isEmpty
          ? Center(
              child: Image.asset(
              'assets/images/empty.png',
              width: 150,
            ))
          : ListView.builder(
              itemBuilder: (context, i) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (v) {
                    context.read<DbProvider>().delete(i);
                    context.read<DbProvider>().disMis();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.11,
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                      color: ColorConst.kCloudColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: ListTile(
                      title: TextWidget.textWidget(
                          text: context.watch<DbProvider>().allDatas[i]
                              ['title'],
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      subtitle: TextWidget.textWidget(
                          text: context.watch<DbProvider>().allDatas[i]['more'],
                          size: 15,
                          color: ColorConst.kSuccessColor,
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 2),
                      leading: Transform.scale(
                        scale: 1.5,
                        child: SizedBox(
                          child: Checkbox(
                            side: BorderSide(
                                width: 1.0, color: ColorConst.kSuccessColor),
                            shape: const CircleBorder(),
                            activeColor: ColorConst.kSuccessColor,
                            value: context.watch<DbProvider>().completed[i],
                            onChanged: (v) async {
                              context.read<DbProvider>().checkDb(i);
                              await context.read<DbProvider>().gener();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: context.watch<DbProvider>().allDatas.length,
            ),
    );
  }
}
