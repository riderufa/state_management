import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:state_management/screens/cart_screen.dart';
import 'package:state_management/screens/products_screen.dart';

class TabItem {
  String title;
  Icon icon;
  TabItem({required this.title, required this.icon});
}

final List<TabItem> _tabBar = [
  TabItem(icon: const Icon(Icons.home), title: 'Products'),
  TabItem(icon: const Icon(Icons.chat), title: 'Cart'),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title, required this.onInit});

  final String title;
  final void Function() onInit;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    widget.onInit();
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProductsConnector(),
          CartConnector(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          })
        },
        currentIndex: _currentTabIndex,
        items: [
          for (final item in _tabBar)
            BottomNavigationBarItem(
              label: item.title,
              icon: item.icon,
            )
        ],
      ),
    );
  }
}
