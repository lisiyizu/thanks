import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thanks/models/scroll_behavior.dart';
import 'package:thanks/pages/developers.dart';
import 'package:thanks/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => SafeArea(
        child: PrimaryScrollController(
          controller: scrollController,
          child: CupertinoScrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              physics: ClampingScrollPhysics(),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        child: Image.asset(
                          "res/assets/taktur.png",
                          scale: 2.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      "All that Thanks",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        "의식적으로 일상에 감사하는 마음을 가지고\n감사의 마음을 넓히세요!",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // personal mental health mentor, cross-platform gratitude journal application built with flutter and 🤘🏼.
                    FlatButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => DevelopersPage(),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: Text(
                          "강원고등학교 드림하이",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Card(
                          elevation: 16,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: DefaultColorTheme.main,
                          child: FlatButton(
                            onPressed: _launchGithub,
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 42,
                                      bottom: 18,
                                      left: 32,
                                      right: 32,
                                    ),
                                    child: Text(
                                      "View on Github",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white24,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 28,
                                      bottom: 32,
                                      left: 32,
                                      right: 32,
                                    ),
                                    child: Text(
                                      "Open Source!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              left: 32,
                            ),
                            child: Card(
                              elevation: 16,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: DefaultColorTheme.sub,
                              child: FlatButton(
                                onPressed: () async {
                                  const url = 'https://play.google.com'
                                      '/store/apps/details?id='
                                      'io.github.tdh8316.thanks';
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 32,
                                        bottom: 32,
                                      ),
                                      child: Text(
                                        "별 5개 주기",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 8,
                              bottom: 8,
                              right: 32,
                            ),
                            child: Card(
                              elevation: 16,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              color: DefaultColorTheme.sub,
                              child: FlatButton(
                                onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        DevelopersPage(),
                                  ),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.all(32),
                                      child: Text(
                                        "제작자",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    /*Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      child: Card(
                        elevation: 16,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: DefaultColorTheme.main,
                        child: FlatButton(
                          onPressed: () {
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              message: "정식 출시를 기다려주세요!",
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                              borderRadius: 8,
                              margin: EdgeInsets.all(8),
                            )..show(context);
                          },
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(32),
                                child: Text(
                                  "모든 기능을 사용하기 위해 All that Thanks 를 구매하세요!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),*/
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Card(
                          elevation: 16,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          color: Colors.white,
                          child: FlatButton(
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (BuildContext context) => ReadmePage(),
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 42,
                                      bottom: 18,
                                      left: 32,
                                      right: 32,
                                    ),
                                    child: Text(
                                      "감사합니다!",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: DefaultColorTheme.main
                                            .withOpacity(0.1),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 28,
                                      bottom: 32,
                                      left: 32,
                                      right: 32,
                                    ),
                                    child: Text(
                                      "개발자의 말...",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: DefaultColorTheme.main,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  _launchGithub() async {
    const url = 'https://github.com/tdh8316/thanks/blob/master/README.md';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ReadmePage extends StatefulWidget {
  @override
  _ReadmePageState createState() => _ReadmePageState();
}

class _ReadmePageState extends State<ReadmePage> {
  Future<String> getText() async {
    return http
        .read("https://raw.githubusercontent.com/tdh8316/thanks/master/readme");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollConfiguration(
          behavior: NoBounceBehavior(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: FutureBuilder(
              future: getText(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                } else {
                  return SingleChildScrollView(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          snapshot.data.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      );
}
