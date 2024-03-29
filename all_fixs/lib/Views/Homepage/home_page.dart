import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/drawer/gf_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Defining a golbal key(_homepagekey) to access the drawer functionality , and we cannot access this key outside the class in which we have defined it
  // and if we add underscore(_) before a variable then it becomes a private variable i.e. _homepagekey
  final GlobalKey<ScaffoldState> _homepagekey = GlobalKey();

  List<IconData> iconslist = [
    FontAwesomeIcons.circleUser,
    FontAwesomeIcons.house,
    FontAwesomeIcons.bell
  ];

  int page=1;
  int Pageview=1;
  PageController pageController = PageController(initialPage: 1);


  Widget pageviewsection(){
    return PageView(
      controller:pageController ,
      onPageChanged: (value){
        setState(() {
print(value);
        },
        );

      },
      children: [
        Container(
          color: Colors.amber,
        ),
         Container(
          color: Colors.green,
        ),
         Container(
          color: Colors.black,
        ),
      ],
    );
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homepagekey,
      appBar: AppBar(
        title: Text(
          "ALL FIXS",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(230, 81, 0, 1),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            //"!" Mark means treat this things as a non-null thing
            _homepagekey.currentState!.openDrawer();
          },
          //drawer is a sccafold's property so we need to define global key in order to access this drawer functionality
          child: Icon(Icons.menu),
        ),
        actions: [
          Container(
            width: 50,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Image.asset("assets/dashboard/chatting.png"),
          ),
        ],
      ),
      /*drawer: GFDrawer(

      ),*/
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.grey[300],
        icons: iconslist,
        activeIndex: page,
        activeColor: Colors.orange[900],
        inactiveColor: Colors.grey[900],
        splashSpeedInMilliseconds: 300,
        notchSmoothness:NotchSmoothness.softEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.none,
        onTap: (p0) {
          setState(() {
            Pageview =p0;
            pageController.animateToPage(p0, duration: Duration(milliseconds: 200), curve: Curves.linear);
          });
        },
      ),
    body: pageviewsection(),
    );
  }
}
