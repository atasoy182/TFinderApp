import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/Animation/FadeAnimation.dart';
import 'package:tfinder_app/constants.dart';
import 'package:tfinder_app/search_page.dart';
import 'package:tfinder_app/widgets/base_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

bool animateBody = true;

class _LoginPageState extends State<LoginPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    animateBody = true;
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateBody = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            animateBody = true;
            return Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text(
          "Hoş Geldiniz",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Color.fromRGBO(65, 202, 198, 1),
            Color.fromRGBO(65, 202, 198, 0.7),
            Color.fromRGBO(65, 202, 198, 0.5),
          ])),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromRGBO(65, 202, 198, 1),
          Color.fromRGBO(65, 202, 198, 0.8),
          Color.fromRGBO(65, 202, 198, 0.6),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1,
                      Center(
                        child: Text(
                          "Oturum Açın",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                      animateBody),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 7 / 10,
                      child: Stack(
                        children: [
                          pageDots(_currentPageIndex, context),
                          PageView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            itemCount: 2,
                            onPageChanged: (ix) {
                              setState(() {
                                _currentPageIndex = ix;
                              });
                            },
                            itemBuilder: (ctx, ix) {
                              if (ix == 1) animateBody = false;
                              return ix == 0
                                  ? loginPageBody()
                                  : registerPageBody();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class loginPageBody extends StatefulWidget {
  @override
  _loginPageBodyState createState() => _loginPageBodyState();
}

class _loginPageBodyState extends State<loginPageBody> {
  bool _obscureText = true;
  String _password;
  final _formLoginPasswordKey = GlobalKey<FormState>();
  final _formLoginEmailKey = GlobalKey<FormState>();

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Spacer(),
        FadeAnimation(
            1.4,
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: turkuazWithOpacity4,
                        blurRadius: 20,
                        offset: Offset(0, 10))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Form(
                    key: _formLoginEmailKey,
                    child: Container(
                      //decoration: BoxDecoration(border: Border.all()),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Center(
                        child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none),
                            validator: (val) {
                              if (!val.contains("@")) {
                                return 'Geçerli bir email adresi giriniz';
                              } else
                                return null;
                            }),
                      ),
                    ),
                  ),
                  Form(
                    key: _formLoginPasswordKey,
                    child: Container(
                      //decoration: BoxDecoration(border: Border.all()),
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffix: IconButton(
                                icon: Icon(Icons.remove_red_eye_sharp),
                                color: Colors.grey,
                                onPressed: _toggle),
                            hintText: "Şifre",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none),
                        obscureText: _obscureText,
                        validator: (val) =>
                            val.length < 6 ? 'Şifre Çok Kısa' : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            animateBody),
        FadeAnimation(
            1.5,
            TextButton(
                onPressed: () => print("Şifremi unuttum"),
                child: Text(
                  "Şifrenizi mi unuttunuz ?",
                  style: TextStyle(color: Colors.grey),
                )),
            animateBody),
        Spacer(),
        FadeAnimation(
          1.6,
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(turkuazDefault)),
              onPressed: () {
                bool validateEmail = _formLoginEmailKey.currentState.validate();
                bool validatePassword =
                    _formLoginPasswordKey.currentState.validate();

                if (validateEmail && validatePassword) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Giriş Yapılıyor')));
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SearchPage();
                  }),
                );
              },
              child: Text(
                "Giriş Yap",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          animateBody,
        ),
        SizedBox(
          height: 30,
        ),
        FadeAnimation(
            1.6,
            Container(
              height: 50,
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(turkuazDefault)),
                onPressed: () {},
                child: Row(
                  children: [
                    Spacer(),
                    Image.asset(
                      "assets/images/google-logo.png",
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Gmail ile giriş",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
            animateBody),
        SizedBox(
          height: 30,
        ),
        FadeAnimation(
            1.5,
            Text(
              "Hesabınız yok mu ? Sola Kaydırın",
              style: TextStyle(color: Colors.grey),
            ),
            animateBody),
        Spacer(),
      ],
    );
  }
}

class registerPageBody extends StatefulWidget {
  @override
  _registerPageBodyState createState() => _registerPageBodyState();
}

class _registerPageBodyState extends State<registerPageBody> {
  final _formRegisterPasswordKey = GlobalKey<FormState>();
  final _formRegisterEmailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 25, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Form(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.4),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Adınız",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Form(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Soy Adınız",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Form(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.4),
                    borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.all(5),
                child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none),
                    validator: (val) {
                      if (!val.contains("@")) {
                        return 'Geçerli bir email adresi giriniz';
                      } else
                        return null;
                    }),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Form(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.4),
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Şifre",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                  validator: (val) => val.length < 6 ? 'Şifre Çok Kısa' : null,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Form(
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 0.4),
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Şifre Tekrar",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                  validator: (val) => val.length < 6 ? 'Şifre Çok Kısa' : null,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              child: DefaultButton(
                btnText: "Kayıt Ol",
                btnCliked: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pageDots(int currentPageIx, BuildContext context) {
  double _pasifBoyut = 10;
  double _aktifBoyut = 15;
  int _currentPageIndex = currentPageIx;

  return _currentPageIndex == 0
      ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _aktifBoyut,
              width: _aktifBoyut,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: _pasifBoyut,
              width: _pasifBoyut,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            )
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: _pasifBoyut,
              width: _pasifBoyut,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: _aktifBoyut,
              width: _aktifBoyut,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor),
            )
          ],
        );
}
