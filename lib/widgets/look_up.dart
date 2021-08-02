import 'package:flutter/material.dart';

enum LookupMode { SingleSelect, MultiSelect }

class Lookup extends StatefulWidget {
  final Color btnColor;
  final Color iconColor;
  final LookupMode lookupMode;
  final List allItems;
  final String dialogTitle;
  final List baslangicDegerleri;
  final String hintText;
  final Function okCliked;

  const Lookup(
      {Key key,
      @required this.btnColor,
      @required this.lookupMode,
      @required this.allItems,
      @required this.dialogTitle,
      @required this.baslangicDegerleri,
      @required this.iconColor,
      this.hintText = "",
      @required this.okCliked})
      : super(key: key);

  @override
  _LookupState createState() => _LookupState();
}

class _LookupState extends State<Lookup> {
  List selectedItems = [];
  List filteredItems;
  List allItemsList;
  List secilmisItemsList;

  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.allItems;
    allItemsList = widget.allItems;
    secilmisItemsList = [];

    // Seçili Başlangıç Değerlerini set eder
    for (var j = 0; j < widget.baslangicDegerleri.length; j++) {
      if (allItemsList.contains(widget.baslangicDegerleri[j])) {
        secilmisItemsList.add(widget.baslangicDegerleri[j]);
      }
    }

    selectedItems = secilmisItemsList;
  }

  void searchOperation(String searchText) {
    var localList = [];
    for (int i = 0; i < allItemsList.length; i++) {
      String data = allItemsList[i];

      if (data.toLowerCase().contains(_controller.text.toLowerCase())) {
        localList.add(data);
      }
    }

    setState(() {
      filteredItems = localList;
    });
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
                selectedItems.join(","),
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
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return AlertDialog(
                              title: Align(child: Text(widget.dialogTitle)),
                              content: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: widget.iconColor,
                                                      width: 0.5),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: widget.iconColor,
                                                      width: 0.5),
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
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
                                                    Icons
                                                        .highlight_remove_sharp,
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
                                              flex: 1,
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
                                          : null,
                                      Expanded(
                                        flex: 7,
                                        child: ListView.builder(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 5, top: 5),
                                            itemCount: filteredItems.length +
                                                selectedItems.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              filteredItems = [
                                                ...selectedItems..sort(),
                                                ...filteredItems..sort()
                                              ].toSet().toList();
                                              try {
                                                return ListTile(
                                                  onTap: () {
                                                    if (!selectedItems.contains(
                                                        filteredItems[index])) {
                                                      if (widget.lookupMode ==
                                                          LookupMode
                                                              .MultiSelect) {
                                                        selectedItems.add(
                                                            filteredItems[
                                                                index]);
                                                      } else {
                                                        selectedItems = [
                                                          filteredItems[index]
                                                        ];
                                                      }
                                                    } else {
                                                      selectedItems.remove(
                                                          filteredItems[index]);
                                                    }
                                                    setState(() {});
                                                  },
                                                  title: Text(
                                                      '${filteredItems[index]}'),
                                                  trailing: selectedItems
                                                          .contains(
                                                              filteredItems[
                                                                  index])
                                                      ? Icon(
                                                          Icons.check,
                                                          color: Colors.green,
                                                        )
                                                      : null,
                                                );
                                              } catch (e) {
                                                return null;
                                              }
                                            }),
                                      ),
                                    ],
                                  )),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    setState(() {});
                                    widget.okCliked(selectedItems);
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
                      });
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
