import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _hakkindaString = widget.tfUser.hakkinda;
    _dersVerilenAlanlar = widget.tfUser.dersVerdigiAlanlar.cast<String>();
    _egitimler = widget.tfUser.egitimler;
    _deneyimler = widget.tfUser.deneyimler;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: GeneralTabChips(assetIconPath: "assets/images/books.png", chipList: _dersVerilenAlanlar),
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
}
