import 'package:flutter/material.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/widgets/general_tab_widgets.dart';

class ProfileGeneralTab extends StatefulWidget {
  final TfUser tfUser;

  const ProfileGeneralTab({Key key, @required this.tfUser}) : super(key: key);

  @override
  _ProfileGeneralTabState createState() => _ProfileGeneralTabState();
}

class _ProfileGeneralTabState extends State<ProfileGeneralTab> with AutomaticKeepAliveClientMixin {
  String _hakkindaString;
  List<String> _dersVerilenAlanlar;
  List _egitimler;
  List _deneyimler;
  List _dersVerilenYerler;
  String _yas;
  String _dersUcretAraligi;

  @override
  void initState() {
    super.initState();
    _hakkindaString = widget.tfUser.hakkinda;
    _dersVerilenAlanlar = widget.tfUser.dersVerdigiAlanlar.cast<String>();
    _egitimler = widget.tfUser.egitimler;
    _deneyimler = widget.tfUser.deneyimler;
    _dersVerilenYerler = widget.tfUser.dersVerilenYerler;
    _yas = widget.tfUser.yas;
    _dersUcretAraligi = widget.tfUser.dersUcretAraligi;
    print("tfuser " + widget.tfUser.toString());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: GeneralTabChips(assetIconPath: "assets/images/books.png", chipList: _dersVerilenAlanlar),
      ),
      SliverToBoxAdapter(
        child: Wrap(
          children: getOtherChip(_dersVerilenYerler, _yas ?? null, _dersUcretAraligi ?? null),
        ),
      ),
      SliverToBoxAdapter(
        child: GeneralTabCard(
          baslikText: "Hakkında",
          longString: _hakkindaString,
          assetIconPath: "assets/images/about.png",
        ),
      ),
      SliverToBoxAdapter(
        child: GeneralEducationTabCard(baslikText: "Eğitim", assetIconPath: "assets/images/graduate.png", gosterilecekListe: _egitimler),
      ),
      SliverToBoxAdapter(
        child: GeneralEducationTabCard(baslikText: "İş Deneyimi", assetIconPath: "assets/images/work.png", gosterilecekListe: _deneyimler),
      ),
      SliverToBoxAdapter(
        child: Container(
          height: 100,
        ),
      ),
//      ,
    ]);
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> getOtherChip(dersverilenYerler, _yas, _dersUcretAraligi) {
    List<Widget> widgetList = [];

    for (var i = 0; i < _dersVerilenYerler.length; i++) {
      widgetList.add(Chip(
          backgroundColor: Colors.transparent,
          avatar: Icon(
            Icons.location_on_outlined,
            color: morDefault,
          ),
          label: Text(_dersVerilenYerler[i].toString(), style: TextStyle(fontSize: 15, color: Colors.black))));
    }

    if (_yas != null) {
      widgetList.add(Chip(
        backgroundColor: Colors.transparent,
        avatar: Icon(
          Icons.cake,
          color: morDefault,
        ),
        label: Text(
          _yas ?? "",
          maxLines: 1,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ));
    }

    if (_dersUcretAraligi != null) {
      widgetList.add(Chip(
        backgroundColor: Colors.transparent,
        avatar: Icon(
          Icons.money,
          color: morDefault,
        ),
        label: Text(
          _dersUcretAraligi ?? "",
          maxLines: 1,
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
      ));
    }
    return widgetList;
  }
}
