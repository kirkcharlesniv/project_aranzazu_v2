import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project_aranzazu_v2/features/events/presentation/pages/events_page.dart';
import 'package:project_aranzazu_v2/features/news/presentation/pages/news_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentPage = 0;
  final _pageOptions = [
    new NewsPage(),
    new MapScreen(),
    new BibleScreen(),
    new EventsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[currentPage],
      bottomNavigationBar: CubertoBottomBar(
        inactiveIconColor: Colors.black,
        tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
        initialSelection: 0,
        drawer: CubertoDrawer(style: CubertoDrawerStyle.NO_DRAWER),
        tabs: [
          TabData(
            iconData: Icons.library_books,
            title: "News",
            tabColor: Colors.deepPurple,
          ),
          TabData(
            iconData: Icons.pin_drop,
            title: "MSKS",
            tabColor: Colors.pink,
          ),
          TabData(
              iconData: Icons.import_contacts,
              title: "Bible",
              tabColor: Colors.amber),
          TabData(
            iconData: Icons.calendar_today,
            title: "Events",
            tabColor: Colors.teal,
          ),
        ],
        onTabChangedListener: (position, title, color) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: Add Maps
    return Scaffold(
      body: Container(
        color: Colors.black,
      ),
    );
  }
}

class BibleScreen extends StatefulWidget {
  @override
  _BibleScreenState createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: Add bible api integration
    return Scaffold(
      body: Container(),
    );
  }
}
