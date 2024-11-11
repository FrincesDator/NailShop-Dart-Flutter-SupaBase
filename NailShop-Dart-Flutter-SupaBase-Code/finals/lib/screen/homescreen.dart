import 'package:flutter/material.dart';
import 'package:finals/constants/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Color(0xFFffe4e1),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/image/header.JPG',
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'BRINGING FASHION TO YOUR FINGERTIPS',
                style: headerTextStyle,
              ),
            ),
            Center(
              child: Text(
                'Discover the latest trends and styles in fashion.',
                style: biggrayTextStyle
              ),
            ),
            Center(
              child: Text(
                'Shop now!',
                style: biggrayTextStyle
              ),
            ),
            SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(FontAwesomeIcons.facebook, size: 40.0, color: Color(0xFF674846)),
                    SizedBox(height: 5.0),
                    Text(
                      'Facebook',
                      style: labelTextStyle,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'facebook.com/chickfleekslc',
                      style: grayTextStyle,
                    ),
                  ],
                ),
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Icon(FontAwesomeIcons.instagram, size: 40.0, color: Color(0xFF674846)),
                    SizedBox(height: 5.0),
                    Text(
                      'Instagram',
                      style: labelTextStyle,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '@chickfleeks.lc',
                      style: grayTextStyle,
                    ),
                  ],
                ),
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Icon(FontAwesomeIcons.globe, size: 40.0, color: Color(0xFF674846)),
                    SizedBox(height: 5.0),
                    Text(
                      'Website',
                      style: labelTextStyle,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'chickfleekslc.com',
                      style: grayTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
