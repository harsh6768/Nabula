import 'package:flutter/material.dart';
import 'package:resort_app/ui/widgets/recently_sold.dart';
import 'package:resort_app/ui/widgets/rent.dart';
import 'package:resort_app/ui/widgets/sale.dart';

class SearchFilter extends StatefulWidget {
  @override
  _SearchFilterState createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Container(
              margin: EdgeInsets.only(left: 1.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              'Filter Your Search',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              )
            ],
            bottom: TabBar(
              isScrollable: true,
              indicator: RectangleTabIndicator(color: Color(0xFF573851)),
              // indicatorColor: Colors.red,
              labelColor: Colors.blueAccent,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
              tabs: [
                Tab(
                  child: Text(
                    'For Sale',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Recently sold',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'For rent',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [Sale(), RecentlySold(), Rent()],
        ),
      ),
    );
  }
}

class RectangleTabIndicator extends Decoration {
  final BoxPainter _painter;

  RectangleTabIndicator({@required Color color})
      : _painter = _RectanglePainter(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _RectanglePainter extends BoxPainter {
  final Paint _paint;

  _RectanglePainter(Color color)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    // colored line
    //offset variable is main concept which will help to change the offset
    final p1 = offset + Offset(cfg.size.width / 1.7, cfg.size.height / 1.1);
    final p2 = offset + Offset(cfg.size.width / 2.8, cfg.size.height / 1.1);
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    canvas.drawLine(p1, p2, paint);
  }
}
