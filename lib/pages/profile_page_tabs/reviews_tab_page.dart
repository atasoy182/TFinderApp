import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/model/tf_user_model.dart';

class ProfileReviewTab extends StatefulWidget {
  final TfUser tfUser;

  const ProfileReviewTab({Key key, this.tfUser}) : super(key: key);

  @override
  _ProfileReviewTabState createState() => _ProfileReviewTabState();
}

class _ProfileReviewTabState extends State<ProfileReviewTab> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // istek burdan atılacak ve pagination yapılacak.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              height: 30,
              margin: EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Text(
                "5 Yorum",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.only(bottom: 15, left: 5, right: 5),
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: buildListItem(),
              );
            },
            childCount: 20, // 1000 list items
          ),
        ),
      ]),
    );
  }

  Widget buildListItem() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: 15,
      ),
      Expanded(
        flex: 2,
        child: CircleAvatar(
            radius: 35,
            backgroundImage: CachedNetworkImageProvider("https://pixomatic.us/blog/wp-content/uploads/2019/11/pixomatic_1572877223091.png")),
      ),
      SizedBox(
        width: 15,
      ),
      Expanded(
        flex: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "Nazlı E.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            ExpandText(
              "Şevval Hanım'a bu siteden ulaştım.Yorumları çok dikkatimi çekmişti sonrasında iletişime geçtim ve ders almaya başladım. 2 ay oldu beraber ilerliyoruz kendisinden çok memnun kaldım. Özel ders almak isteyenlere tavsiye edebilirim. Nasıl bir yol izleyeceğimizi, motivasyonum düştüğü zaman tekrar ben kendime getirdi. Çok sabırlı ve neşeli bir insan. Bilgisi ders anlatma metodu çok güzel. Benim beklentilerimi çok ilgili bir şekilde karşılıyor. Kendisine ilgisi için teşekkür ediyorum.",
              maxLines: 5,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(),
      ),
    ]);
  }

  @override
  bool get wantKeepAlive => true;
}
