import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_app/components/map_component.dart';
import 'package:map_app/main.dart';
import 'package:map_app/models/post.dart';
import 'package:map_app/screens/home_states/feed_state.dart';
import 'package:map_app/screens/home_states/map_state.dart';

class HomeScreen extends StatefulWidget {
  final void Function(int selectedIndex) onTabChanged; // Callback parameter

  const HomeScreen({Key? key, required this.onTabChanged}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_selectedIndex != _tabController.index) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
        widget.onTabChanged(_selectedIndex);
        print("Selected Index: " + _selectedIndex.toString());
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const TopBar(),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [MapState(), FeedState()]),
          ),
          BottomBar(
            selectedIndex: _selectedIndex,
            setIndex: (n) {
              _tabController.animateTo(n);
            },
          )
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar(
      {super.key, required this.selectedIndex, required this.setIndex});

  final int selectedIndex;
  final Function(int)? setIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 20,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Pill(
            icon: SvgPicture.asset('assets/Chat.svg'),
          ),
          SizedBox(
            width: 20,
          ),
          Pill(
            icon: SvgPicture.asset('assets/Globe.svg'),
            active: selectedIndex == 0,
            big: true,
            callback: () {
              setIndex!(0);
            },
          ),
          SizedBox(
            width: 20,
          ),
          Pill(
            icon: SvgPicture.asset('assets/People.svg'),
            active: selectedIndex == 1,
            big: true,
            callback: () {
              setIndex!(1);
            },
          ),
          SizedBox(
            width: 30,
          ),
          Pill(icon: SvgPicture.asset('assets/Search.svg'))
        ],
      ),
    );
  }
}

class Pill extends StatelessWidget {
  final Widget icon;
  final bool active;
  final bool big;
  final void Function()? callback;

  const Pill(
      {required this.icon,
      this.active = false,
      this.big = false,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: big ? 70 : 45,
        child: GestureDetector(
          onTapUp: (details) {
            callback!();
          },
          // height: big ? 70 : 45,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, 6),
                      color: Colors.black,
                    ),
                  ],
                  color: active
                      ? appTheme.primaryColor
                      : appTheme.unselectedWidgetColor,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Color.fromRGBO(79, 68, 93, 1),
                    width: 4.0,
                  ),
                ),
              ),
              Positioned(top: -10, child: icon),
            ],
          ),
        ));
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double iconSize = 27;

    return Container(
      // height: safePadding,
      // decoration: BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/Settings.svg',
            width: iconSize,
          ),
          Text('Platform',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'FasterOne', fontSize: 20, shadows: [
                Shadow(
                    // bottomLeft
                    offset: Offset(-1.5, -1.5),
                    color: Colors.white),
                Shadow(
                    // bottomRight
                    offset: Offset(1.5, -1.5),
                    color: Colors.white),
                Shadow(
                    // topRight
                    offset: Offset(1.5, 1.5),
                    color: Colors.white),
                Shadow(
                    // topLeft
                    offset: Offset(-1.5, 1.5),
                    color: Colors.white),
              ])),
          SvgPicture.asset(
            'assets/FilterButton.svg',
            width: iconSize,
          )
          // Icon(
          //   Icons.assignment_outlined,
          //   size: iconSize,
          //   color: Colors.white,
          // )
        ],
      ),
    );
  }
}
