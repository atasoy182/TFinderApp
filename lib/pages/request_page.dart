import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/widgets/fab_menu.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final List<String> items = List<String>.generate(10000, (i) => 'Item $i');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: buildList(items),
      ),
      floatingActionButton: ExampleExpandableFab(),
    );
  }

  ListView buildList(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${items[index]}'),
        );
      },
    );
  }
}
