// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_flutter_fullstack/src/constants/assest.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/calendar.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/cloudmate.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/custom_drawer.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/custom_tabbar.dart';
import 'package:learn_flutter_fullstack/src/pages/home/widget/leave.dart';
import 'package:learn_flutter_fullstack/src/viewmodels/tabmenu_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewMoodel().items;
  @override
  Widget build(BuildContext context) {
    /*
    return DefaultTabController(
      length: _tabsMenu.length,      
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: _tabsMenu.map((item) => item.widget).toList(),
        ),        
      ),
    );
    */

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: _buildAppBar(),
        drawer: CustomDrawer(),
        body: TabBarView(
          children: [
            CloudMate(),
            Calendar(), //ลำบากมาก ใช้คีย์บอร์ดร่วมไม่ได้ Ctrl+v, c ไม่ได้เลย
            Leave(),
          ],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
            bottom: 10.0,
          ),
          color: Colors.green,
          child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[600],
            indicatorWeight: 5.0,
            indicatorColor: Colors.red,
            tabs: [
              Tab(
                text: 'Cloud Mate',
                icon: Icon(FontAwesomeIcons.box),
              ),
              Tab(
                text: 'Calendar',
                icon: Icon(FontAwesomeIcons.calendarCheck),
              ),
              Tab(
                text: 'Leave',
                icon: Icon(FontAwesomeIcons.fileArrowDown),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Employee Self Service'),
      //bottom: CustomTabBar(_tabsMenu),
      actions: [
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.qr_code),
          onPressed: () {},
        )
      ],
    );
  }
}
