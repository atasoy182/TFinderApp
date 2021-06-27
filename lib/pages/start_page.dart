import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/pages/login_page.dart';
import 'package:tfinder_app/pages/search_page.dart';
import 'package:tfinder_app/viewmodel/tf_user_view_model.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _tfUserModel = Provider.of<TfUserViewModel>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Stack(children: [
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.7),
              ),
            ),
            //imageShow(size),
          ]),
          Spacer(),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "En iyi öğretmenleri bul!",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "En iyi öğretmenler ile tanışmak artık çok kolay !",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: turuncuDefault.withOpacity(.5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () async {
                  var res = await _tfUserModel.getCurrentUser();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      print("Material page route:" + res.toString());
                      if (res == null) {
                        return LoginPage();
                      } else {
                        return SearchPage();
                      }
                    }),
                  );
                },
                color: turuncuDefault,
                textColor: Colors.white,
                child: Icon(
                  Icons.arrow_forward,
                  size: 24,
                ),
                padding: EdgeInsets.all(16),
                shape: CircleBorder(),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ));
  }

  Center imageShow(Size size) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(top: 20),
          height: size.height * .40,
          child: Image(image: AssetImage('assets/images/professor.png'))),
    );
  }
}

//Container containerEg(Size size) {
//  return Container(
//    height: size.height * .45,
//    decoration: BoxDecoration(
//      //color: Color.fromRGBO(250, 151, 93, 0.8),
//      gradient: LinearGradient(
//        begin: Alignment.topCenter,
//        end: Alignment.bottomCenter,
//        colors: [
//          Color.fromRGBO(250, 151, 93, 0.7),
//          Color.fromRGBO(255, 223, 204, 1),
//        ],
//      ),
//      boxShadow: [
//        BoxShadow(
//            color: Colors.black54,
//            blurRadius: 15.0,
//            offset: Offset(0.0, 0.75))
//      ],
//    ),
//  );
//}
