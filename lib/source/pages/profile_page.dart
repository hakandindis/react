// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:react/source/pages/home/home_page.dart';
import 'package:react/source/pages/profile_page.dart';
import 'package:react/source/router/route.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 1;
  }

  void onTap(int index) {
    currentIndex = index;

    if (currentIndex == 1) {
      //do nothing
    } else {
      Navigator.of(context).pushNamed(AppRoutes.mainPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 2,
      vsync: this,
    );

    return homePageBuild(_tabController, context);
  }

  Scaffold homePageBuild(TabController _tabController, BuildContext context) {
    return Scaffold(
      body: homePageBuilder(_tabController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.addPostPage);
        },
        child: Icon(Icons.add_a_photo_outlined),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        iconSize: 40,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 5, 17, 51),
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(137, 9, 154, 211),
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Column homePageBuilder(TabController _tabController) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 100),
        Container(
          //padding: EdgeInsets.only(top: 10),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 20, right: 20),
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicator: CircleTabIndicator(color: Colors.redAccent, radius: 4),
              tabs: [
                Tab(text: "Aktif Sorunlar"),
                Tab(text: "Çözülmüş Sorunlar"),
              ],
            ),
          ),
        ),
        Expanded(
          //margin: const EdgeInsets.only(top: 10),
          //width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: TabBarView(
              controller: _tabController,
              children: [
                HomePage(),
                HomePage(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
      configuration.size!.width / 2 - radius / 2,
      configuration.size!.height - radius,
    );

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

































// // ignore_for_file: prefer_const_constructors

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   File? _pickedImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTap: getImage,
//             child: CircleAvatar(
//               radius: 40,
//               backgroundColor: Colors.grey,
//               backgroundImage:
//                   _pickedImage != null ? FileImage(_pickedImage!) : null,
//               child: _pickedImage != null
//                   ? Container()
//                   : const Icon(
//                       Icons.photo,
//                       color: Colors.white,
//                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future getImage()          async {
//     var pickImage = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );

//     setState(() {
//       _pickedImage = File(pickImage!.path);
//     });
//   }
// }
