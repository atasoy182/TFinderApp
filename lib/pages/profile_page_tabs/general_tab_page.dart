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

  @override
  void initState() {
    super.initState();
    _hakkindaString = widget.tfUser.hakkinda;
    _dersVerilenAlanlar = widget.tfUser.dersVerdigiAlanlar.cast<String>();
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
        child: GeneralEducationTabCard(
          baslikText: "Eğitim",
          assetIconPath: "assets/images/graduate.png",
          year: "2020",
          calisilanyerText: "İstanbul Arel Üniversitesi",
          calisilanbolumText: "Bilgisayar mühensiliği",
        ),
      ),
      SliverToBoxAdapter(
        child: GeneralEducationTabCard(
          baslikText: "İş Deneyimi",
          assetIconPath: "assets/images/work.png",
          year: "2021",
          calisilanyerText: "Dia Yazılım",
          calisilanbolumText: "Yazılım Geliştirici",
        ),
      ),
//      ,
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}

//SliverGrid.count(
//        crossAxisCount: 1,
//        childAspectRatio: 4 / 1.4,
//        children: List.generate(100, (index) {
//          return Card(
//            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//            elevation: 1,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(20),
//            ),
//            child: Container(
//              height: 50,
//              child: Center(
//                child: Text("Some text here"),
//              ),
//            ),
//          );
//        }),
//      )

//      SliverToBoxAdapter(
//        child: Container(
//          //color: Colors.red,
//          height: 80,
//          width: 100,
//          child: Row(
//            children: [
//              Expanded(
//                flex: 2,
//                child: CircleAvatar(
//                    radius: 50,
//                    backgroundImage: CachedNetworkImageProvider(_imageUrl)),
//              ),
//              Expanded(flex: 8, child: Container()),
//            ],
//          ),
//        ),
//      ),
