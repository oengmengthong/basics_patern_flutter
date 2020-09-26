import 'package:flutter/cupertino.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mchat_app/model/chatData.dart';
import 'package:mchat_app/model/itemMember.dart';
import 'package:mchat_app/model/itemPriority.dart';
import 'package:mchat_app/model/itemStatus.dart';
import 'package:mchat_app/provider/todoListprovider.dart';
import 'package:mchat_app/utils/style.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'func.dart';

class UtilWidget {
  static startPickDateWidget(
      BuildContext context, ToDoListProvider toDoListProvider) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      print(date);
      return toDoListProvider
          .setStartDate(UtilFun.fullDateFormatUntil(date.toString()));
    }
  }

  static endPickDateWidget(
      BuildContext context, ToDoListProvider toDoListProvider) async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 10),
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: DateTime.now(),
    );
    if (date != null) {
      return toDoListProvider
          .setEndDate(UtilFun.fullDateFormatUntil(date.toString()));
    }
  }

  static showPopUpStatus(
      BuildContext context, ToDoListProvider toDoListProvider) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Status'),

            content: Container(
              height: MediaQuery.of(context).size.width *0.8,
              child: ListView.builder(
                  itemCount: itemStatus.length,
                  itemBuilder: (context, index) {
                    bool _select = false;

                    if (itemStatus[index].name ==
                        toDoListProvider.status.text) {
                      _select = true;
                    }

                    return ListTile(
                      onTap: () {
                        toDoListProvider.setStatus(itemStatus[index]);
                        Navigator.pop(context);
                      },
                      trailing: _select
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.teal,
                            )
                          : null,
                      title: Text(itemStatus[index].name),
                    );
                  }),
            ),
          );
        });
  }

  static showPopUpPriority(
      BuildContext context, ToDoListProvider toDoListProvider) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Status'),
            content: Container(
              height: MediaQuery.of(context).size.width *0.8,
              child: ListView.builder(
                  itemCount: itemPriority.length,
                  itemBuilder: (context, index) {
                    bool _select = false;
                    if (itemPriority[index].name ==
                        toDoListProvider.priority.text) {
                      _select = true;
                    }
                    return ListTile(
                      onTap: () {
                        toDoListProvider.setPriority(itemPriority[index]);
                        Navigator.pop(context);
                      },
                      trailing: _select
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.teal,
                            )
                          : null,
                      title: Text(itemPriority[index].name),
                    );
                  }),
            ),
          );
        });
  }

  static showPopUpAssignTo(
      BuildContext context, ToDoListProvider toDoListProvider) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Member'),
            content: Container(
              height: MediaQuery.of(context).size.width *0.8,
              child: ListView.builder(
                  itemCount: itemMember.length,
                  itemBuilder: (context, index) {
                    bool _select = false;
                    if (itemMember[index].name ==
                        toDoListProvider.assignTo.text) {
                      _select = true;
                    }
                    return ListTile(
                      onTap: () {
                        toDoListProvider.setAssignTo(itemMember[index]);
                        Navigator.pop(context);
                      },
                      trailing: _select
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.teal,
                            )
                          : null,
                      title: Text(itemMember[index].name),
                    );
                  }),
            ),
          );
        });
  }

  static Widget bottomSheetCreateTodo(
      BuildContext context, ToDoListProvider toDoListProvider) {
    showRoundedModalBottomSheet(
        context: context,
        radius: 20,
        autoResize: true,
        dismissOnTap: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Scrollbar(
              controller: new ScrollController(),
              isAlwaysShown: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Create Todo', style: UtilStyle.headerForm),
                      TextField(
                        controller: toDoListProvider.title,
                        decoration: InputDecoration(
                            labelText: 'Title',
                            labelStyle: UtilStyle.placeHolderText,
                            suffixIcon: Icon(Icons.title, color: Colors.teal),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                      ),
                      TextField(
                        controller: toDoListProvider.description,
                        decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: UtilStyle.placeHolderText,
                            suffixIcon:
                                Icon(Icons.text_fields, color: Colors.teal),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                      ),
                      GestureDetector(
                        onTap: () => startPickDateWidget(context, toDoListProvider),
                        child: TextField(
                          enabled: false,
                          controller: toDoListProvider.startDate,
                          decoration: InputDecoration(
                              suffixIcon: Icon(FontAwesomeIcons.calendarWeek,
                                  color: Colors.teal),
                              labelText: 'Start Date',
                              labelStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => endPickDateWidget(context, toDoListProvider),
                        child: TextField(
                          enabled: false,
                          controller: toDoListProvider.endDate,
                          decoration: InputDecoration(
                              suffixIcon: Icon(
                                FontAwesomeIcons.calendarWeek,
                                color: Colors.teal,
                              ),
                              labelText: 'Start Date',
                              labelStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showPopUpStatus(context, toDoListProvider),
                        child: TextField(
                          enabled: false,
                          controller: toDoListProvider.status,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: Colors.teal),
                              labelText: 'Status',
                              labelStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showPopUpPriority(context, toDoListProvider),
                        child: TextField(
                          enabled: false,
                          controller: toDoListProvider.priority,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: Colors.teal),
                              labelText: 'Priority',
                              labelStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal))),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => showPopUpAssignTo(context, toDoListProvider),
                        child: TextField(
                          enabled: false,
                          controller: toDoListProvider.assignTo,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.arrow_drop_down,
                                  color: Colors.teal),
                              labelText: 'Assign To',
                              labelStyle: UtilStyle.placeHolderText,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlatButton(
                              color: Colors.red,
                              onPressed: () {},
                              child: Text('Cancel'),
                            ),
                            FlatButton(
                              color: Colors.green,
                              onPressed: () {},
                              child: Text('Ok'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  static Widget popUpMenuChat(
      {BuildContext context,
      widget,
      ChatData data,
      ToDoListProvider toDoListProvider}) {
    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      blurSize: 0.2,
      menuItemExtent: 45,
      menuOffset: 8,
      menuBoxDecoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      duration: Duration(microseconds: 1),
      animateMenuItems: true,
      blurBackgroundColor: Colors.black54,
      bottomOffsetHeight: 100,
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            title: Text("Add to ToDoList", style: UtilStyle.whiteBoldText14),
            backgroundColor: Colors.transparent,
            trailingIcon: Icon(FontAwesomeIcons.tasks, color: Colors.white),
            onPressed: () {
              toDoListProvider.setTitle(data.content);
              return bottomSheetCreateTodo(context, toDoListProvider);
            }),
        FocusedMenuItem(
            title: Text("Add to Meeting", style: UtilStyle.whiteBoldText14),
            trailingIcon:
                Icon(FontAwesomeIcons.bookReader, color: Colors.white),
            backgroundColor: Colors.transparent,
            onPressed: () {}),
        FocusedMenuItem(
            title: Text("Add to Remainder", style: UtilStyle.whiteBoldText14),
            backgroundColor: Colors.transparent,
            trailingIcon: Icon(Icons.watch_later, color: Colors.white),
            onPressed: () {}),
      ],
      onPressed: () {},
      child: widget,
    );
  }
}
