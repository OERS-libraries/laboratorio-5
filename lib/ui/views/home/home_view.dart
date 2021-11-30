import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:example_app/constants/colors.dart';
import 'package:example_app/ui/views/home/explore_view.dart';
import 'package:example_app/ui/views/home/for_you_view.dart';
import 'package:example_app/ui/views/home/settings.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  _HomeView createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  int _currentPage = 1;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: PageView(
        controller: _pageController,
        children: [Explore(),ForYouView(),Settings()],
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }

  CurvedNavigationBar _bottomBar() {
    return CurvedNavigationBar(
      index: _currentPage,
      backgroundColor: Colors.transparent,
      animationDuration: const Duration(milliseconds: 300),
      items: const <Widget>[
        Icon(Icons.auto_awesome_mosaic_rounded, size: 30),
        Icon(Icons.home, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      onTap: (int index) {
        setState(() {
          _currentPage = index;
          _pageController!.animateToPage(index,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        });
      },
    );
  }
}
