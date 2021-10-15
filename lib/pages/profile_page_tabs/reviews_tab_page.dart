import 'package:cached_network_image/cached_network_image.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'package:tfinder_app/viewmodel/tf_user_view_model.dart';

class ProfileReviewTab extends StatefulWidget {
  final TfUser tfUser;

  const ProfileReviewTab({Key key, this.tfUser}) : super(key: key);

  @override
  _ProfileReviewTabState createState() => _ProfileReviewTabState();
}

class _ProfileReviewTabState extends State<ProfileReviewTab>
    with AutomaticKeepAliveClientMixin {
  List requests;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasMore = true;
  final int requestPerPage = 5;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        if (requests != null && requests.length > 0) {
          print("SONUNCU ELEMAN: " + requests.last.toString());
          var sonuncueleman = requests.last;
          getMoreRequests(sonuncueleman['olusturulma_tarihi']);
        }
      }
    });
    // istek burdan atılacak ve pagination yapılacak.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getMoreRequests(null);
    });
  }

  getMoreRequests(sonTarih) async {
    if (!_isLoading && _hasMore) {
      _isLoading = true;
      final _tfUserModel = Provider.of<TfUserViewModel>(context, listen: false);
      var oldRequestArrived = await _tfUserModel.getCommentsWithPagination(
          widget.tfUser.userID, sonTarih, requestPerPage);
      if (sonTarih == null) {
        requests = [];
      }
      if (oldRequestArrived.length < requestPerPage) {
        _hasMore = false;
      }
      requests.addAll(oldRequestArrived);
      _isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverToBoxAdapter(
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Container(
              height: 10,
              margin: EdgeInsets.only(left: 8, right: 8, top: 8),
            ),
          ),
        ),
        requests != null
            ? requests.length > 1
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (_hasMore && index + 1 == requests.length) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: LoadingIndicator(
                                indicatorType: Indicator.ballRotateChase,
                                color: turkuazDefault.withOpacity(0.4),
                              ),
                            ),
                          );
                        }
                        return Card(
                          margin:
                              EdgeInsets.only(bottom: 15, left: 5, right: 5),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: buildListItem(requests[index]),
                        );
                      },
                      childCount: requests.length, // 1000 list items
                    ),
                  )
                : noRequestsYetUi()
            : SliverToBoxAdapter(),
      ]),
    );
  }

  Widget buildListItem(request) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        width: 15,
      ),
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: CircleAvatar(
              radius: 35,
              backgroundImage:
                  CachedNetworkImageProvider(request['yazanProfilUrl'])),
        ),
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
              request['yazan'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            ExpandText(
              // "Şevval Hanım'a bu siteden ulaştım.Yorumları çok dikkatimi çekmişti sonrasında iletişime geçtim ve ders almaya başladım. 2 ay oldu beraber ilerliyoruz kendisinden çok memnun kaldım. Özel ders almak isteyenlere tavsiye edebilirim. Nasıl bir yol izleyeceğimizi, motivasyonum düştüğü zaman tekrar ben kendime getirdi. Çok sabırlı ve neşeli bir insan. Bilgisi ders anlatma metodu çok güzel. Benim beklentilerimi çok ilgili bir şekilde karşılıyor. Kendisine ilgisi için teşekkür ediyorum.",
              request['yorum'] ?? " ",
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

  Widget noRequestsYetUi() {
    // TODO yorum Yapılmamış resim koyulabilir
    return SliverToBoxAdapter(
        child: SizedBox(
      height: 200,
      child: Center(
          child: Text(
        "Henüz Yorum yapılmadı !",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      )),
    ));
  }
}
