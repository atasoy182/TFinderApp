import 'package:flutter/material.dart';

enum LookupMode { SingleSelect, MultiSelect }

class Lookup extends StatefulWidget {
  final Color btnColor;
  final LookupMode lookupMode;
  final List allItems;
  final String dialogTitle;
  final List baslangicDegerleri;

  const Lookup(
      {Key key,
      @required this.btnColor,
      @required this.lookupMode,
      @required this.allItems,
      @required this.dialogTitle,
      @required this.baslangicDegerleri})
      : super(key: key);

  @override
  _LookupState createState() => _LookupState();
}

class _LookupState extends State<Lookup> {
  List selectedItems = [];
  List filteredItems;
  List allItemsList;
  List secilmisItemsList;
  String filterString = "";

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
      filterString = _controller.text;
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
                    builder: (BuildContext context) => StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          title: Text(widget.dialogTitle),
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
                                                  color: Colors.grey,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),
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
                                                color: Colors.black,
                                                size: 35,
                                              ),
                                              onPressed: () {
                                                searchOperation(
                                                    _controller.text);
                                              },
                                            ),
                                            hintText: "Arama...",
                                            hintStyle: new TextStyle(
                                                color: Colors.black)),
                                        onChanged: searchOperation,
                                      )),
                                  Expanded(
                                    flex: 8,
                                    child: ListView.builder(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, top: 5),
                                        itemCount: filteredItems.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            onTap: () {
                                              if (!selectedItems.contains(
                                                  filteredItems[index])) {
                                                selectedItems
                                                    .add(filteredItems[index]);
                                              } else {
                                                selectedItems.remove(
                                                    filteredItems[index]);
                                              }
                                              setState(() {});
                                            },
                                            title:
                                                Text('${filteredItems[index]}'),
                                            trailing: selectedItems.contains(
                                                    filteredItems[index])
                                                ? Icon(
                                                    Icons.check,
                                                    color: Colors.green,
                                                  )
                                                : null,
                                          );
                                        }),
                                  ),
                                ],
                              )),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState(() {});
                                Navigator.pop(context, 'Tamam');
                              },
                              child: const Text('Tamam'),
                            ),
                          ],
                        );
                      },
                    ),
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
