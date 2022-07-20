import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const Color color_facebook = Color(0xff1177ef);
  static const Color color_google = Color(0xffffffff);
  static const Color color_kakaotalk = Color(0xffffe812);
  static const Color color_naver = Color(0xff0cce5c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // App Logo
            Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                width: 150,
                height: 150,
                child: const Placeholder()),
            Text('SNS로 로그인'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Material(
                      color: color_naver,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(30, 30),
                              child: SvgPicture.asset('assets/icons/naver.svg'),
                            ), // <-- Icon
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Material(
                      color: color_kakaotalk,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(30, 30),
                              child: SvgPicture.asset(
                                  'assets/icons/kakaotalk.svg'),
                            ), // <-- Icon
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Material(
                      color: color_facebook,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(24, 24),
                              child:
                                  SvgPicture.asset('assets/icons/facebook.svg'),
                            ), // <-- Icon
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.all(5),
                  child: ClipOval(
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                          side: const BorderSide(color: Colors.grey, width: 0.5)),
                      color: color_google,
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox.fromSize(
                              size: Size(30, 30),
                              child:
                                  SvgPicture.asset('assets/icons/google.svg'),
                            ), // <-- Icon
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
