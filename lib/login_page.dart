import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/Animation/FadeAnimation.dart';
import 'package:tfinder_app/constants.dart';

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
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
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
                              print(" changed index" + ix.toString());
                              setState(() {
                                _currentPageIndex = ix;
                              });
                            },
                            itemBuilder: (ctx, ix) {
                              if (ix == 1) animateBody = false;
                              _currentPageIndex = ix;
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

  // Toggles the password show status
  void _toggle() {
    print("toggled");
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        FadeAnimation(
            1.4,
            Container(
              margin: EdgeInsets.all(5),
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
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey[200]))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Şifre",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none),
                      obscureText: _obscureText,
                      validator: (val) =>
                          val.length < 6 ? 'Şifre Çok Kısa' : null,
                      onSaved: (val) => _password = val,
                    ),
                  ),
                ],
              ),
            ),
            animateBody),
        Spacer(),
        SizedBox(
          height: 15,
        ),
        FadeAnimation(
            1.5,
            TextButton(
                onPressed: _toggle,
                child: Text(
                  "Şifrenizi mi unuttunuz ?",
                  style: TextStyle(color: Colors.grey),
                )),
            animateBody),
        SizedBox(
          height: 10,
        ),
        FadeAnimation(
          1.6,
          SizedBox(
            height: 50,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(turkuazDefault)),
              onPressed: () {},
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

class registerPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.all(50),
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ],
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
