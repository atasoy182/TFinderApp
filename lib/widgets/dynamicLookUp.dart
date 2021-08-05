import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../constants.dart';

class DynamicLookUp extends StatefulWidget {
  final String selectedItem;
  final Color btnColor;
  final String dialogTitle;
  final Color iconColor;
  final String hintText;
  final Function okCliked;
  final List<String> extraList;
  final String apiURL;

  const DynamicLookUp(
      {Key key,
      this.selectedItem = "",
      @required this.btnColor,
      @required this.dialogTitle,
      @required this.iconColor,
      this.hintText = "",
      this.okCliked,
      this.extraList,
      @required this.apiURL})
      : super(key: key);

  @override
  _DynamicLookUpState createState() => _DynamicLookUpState();
}

class _DynamicLookUpState extends State<DynamicLookUp> {
  String selectedItem;

  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedItem = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 8,
              child: Text(
                selectedItem,
                maxLines: 2,
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.search,
                  color: widget.btnColor,
                  size: 35,
                ),
                onPressed: () async {
                  final res = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      var allItems = [];
                      var cachedList = [];
                      bool getiriliyor = false;

                      if (selectedItem.length > 0) {
                        allItems.add(selectedItem);
                      }

                      if (widget.extraList.length > 0) {
                        cachedList.addAll(widget.extraList);
                        allItems.addAll(widget.extraList);
                        allItems = allItems.toSet().toList();
                      }

                      return StatefulBuilder(
                        builder: (context, setState) {
                          void searchOperation(String searchText) async {
                            setState(() {
                              getiriliyor = true;
                            });

                            var localList = [];

                            var text = _controller.text;
                            var url = widget.apiURL + text;
                            bool flag = false;

                            for (var i = 0; i < cachedList.length; i++) {
                              if (cachedList[i]
                                  .toLowerCase()
                                  .contains(text.toLowerCase())) {
                                if (!localList.contains(cachedList[i])) {
                                  localList.add(cachedList[i]);
                                  flag = true;
                                }
                              }
                            }

                            try {
                              if (!flag) {
                                var response = await http.get(url);
                                List decodedJson = json.decode(response.body);
                                decodedJson.forEach((element) {
                                  if (!localList.contains(element['name'])) {
                                    localList.add(element['name']);
                                  }
                                  if (!cachedList.contains(element['name'])) {
                                    cachedList.add(element['name']);
                                  }
                                });
                              }
                            } catch (e) {}

                            setState(() {
                              getiriliyor = false;
                              allItems = localList;
                            });
                          }

                          return AlertDialog(
                            title: Align(child: Text(widget.dialogTitle)),
                            content: Container(
                                height: MediaQuery.of(context).size.height / 2,
                                //color: Colors.green,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: TextField(
                                          controller: _controller,
                                          style: new TextStyle(
                                            color: Colors.black,
                                          ),
                                          decoration: new InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: widget.iconColor,
                                                    width: 0.5),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: widget.iconColor,
                                                    width: 0.5),
                                              ),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              filled: true,
                                              prefixIcon: IconButton(
                                                padding: EdgeInsets.all(0),
                                                icon: Icon(
                                                  Icons.search_sharp,
                                                  color: widget.iconColor,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  searchOperation(
                                                      _controller.text);
                                                },
                                              ),
                                              suffixIcon: IconButton(
                                                padding: EdgeInsets.all(0),
                                                icon: Icon(
                                                  Icons.highlight_remove_sharp,
                                                  color: Colors.redAccent,
                                                  size: 32,
                                                ),
                                                onPressed: () {
                                                  _controller.clear();
                                                  searchOperation("");
                                                },
                                              ),
                                              hintText: "Arama...",
                                              hintStyle: new TextStyle(
                                                  color: Colors.black)),
                                          onChanged: searchOperation,
                                        )),
                                    widget.hintText.length > 0
                                        ? Expanded(
                                            flex: 2,
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 5),
                                              child: Center(
                                                child: Text(
                                                  widget.hintText,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey),
                                                ),
                                              ),
                                            ))
                                        : Container(),
                                    Expanded(
                                        flex: 6,
                                        child: Stack(
                                          children: [
                                            Container(
                                              // color: Colors.green,
                                              child: ListView.builder(
                                                  itemCount:
                                                      selectedItem.length > 0
                                                          ? allItems.length + 1
                                                          : allItems.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    if (selectedItem.length >
                                                        0) {
                                                      allItems.insert(
                                                          0, selectedItem);
                                                      allItems = allItems
                                                          .toSet()
                                                          .toList();
                                                    }

                                                    try {
                                                      return ListTile(
                                                          onTap: () {
                                                            if (selectedItem ==
                                                                allItems[
                                                                    index]) {
                                                              setState(() {
                                                                selectedItem =
                                                                    "";
                                                              });
                                                            } else {
                                                              setState(() {
                                                                selectedItem =
                                                                    allItems[
                                                                        index];
                                                              });
                                                            }
                                                          },
                                                          title: Text(
                                                              '${allItems[index]}'),
                                                          trailing: allItems[
                                                                      index] ==
                                                                  selectedItem
                                                              ? Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : null);
                                                    } catch (e) {
                                                      return null;
                                                    }
                                                  }),
                                            ),
                                            getiriliyor
                                                ? Align(
                                                    alignment: Alignment.center,
                                                    child: SizedBox(
                                                      height: 75,
                                                      child: LoadingIndicator(
                                                        indicatorType: Indicator
                                                            .ballRotateChase,
                                                        color: defaultLink,
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        )),
                                  ],
                                )),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  setState(() {});
                                  widget.okCliked(selectedItem);
                                  Navigator.pop(context, 'Tamam');
                                },
                                child: const Text(
                                  'Tamam',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
