import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test001/common/global.dart';
import 'tabs/home.dart';
import 'tabs/mine.dart';
import 'tabs/starttest.dart';

const IconFont = "appIconFont";

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar>{
  int _currentIndex = 0; //当前是第几个导航item
  DateTime _lastPressedTime; //给上次点击返回计时

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      appBar: AppBar(title: Text('抑郁症测试')),
      body: WillPopScope(
          onWillPop: () {               //导航返回拦截
            if (_lastPressedTime == null ||
                DateTime.now().difference(_lastPressedTime) >
                    Duration(seconds: 1)) {
              Fluttertoast.showToast(
                msg: "再按一次退出程序",
              );
              _lastPressedTime = DateTime.now();
              return Future.value(false);
            }
            return Future.value(true);
          }, 

          child: PageView(
            //可滚动列表组件，默认横向
            physics:
                NeverScrollableScrollPhysics(), //ban了用户滑动界面来切换，只能点击底部导航item
            controller: _controller,
            children: <Widget>[
              HomePage(),
              StartTestPage(),
              MinePage(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
          //导航栏
          currentIndex: _currentIndex,
          backgroundColor: Color(BG_COLOR),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.green,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _controller.animateToPage(index, //滑动的动画效果
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut);
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('首页'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('测试'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我'),
            )
          ]),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
