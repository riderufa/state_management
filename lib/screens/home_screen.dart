import 'package:flutter/material.dart';
import 'package:module_business/module_business.dart';
import 'package:module_data/module_data.dart';
import 'package:state_management/screens/cart_screen.dart';

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
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final CartBloc _bloc;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _bloc = CartBloc(ProductRepository());
    _bloc.action.add(GetProductsAction());
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
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<AppState>(
        stream: _bloc.state,
        builder: (context, snapshot) => TabBarView(
          controller: _tabController,
          children: [
            ProductList(
              products: snapshot.data?.products,
              addProductToCart: (p) => _bloc.action
                  .add(AddProductCartAction(snapshot.data!.cartProducts, p)),
            ),
            CartPage(
              products: snapshot.data?.cartProducts,
              removeProductFromCart: (p) => _bloc.action
                  .add(RemoveProductCartAction(snapshot.data!.cartProducts, p)),
            ),
          ],
        ),
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

class ProductList extends StatelessWidget {
  List<ProductData>? products;
  final Function(ProductData) addProductToCart;

  ProductList({
    super.key,
    this.products,
    required this.addProductToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: products
                ?.map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            e.title,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () => addProductToCart(e),
                            child: const Text('Add to cart'),
                          ),
                        ],
                      ),
                    ))
                .toList() ??
            [],
      ),
    );
  }
}
