import 'package:cupertino_store/product_list_tab.dart';
import 'package:cupertino_store/search_tab.dart';
import 'package:cupertino_store/shopping_cart_tab.dart';
import 'package:flutter/cupertino.dart';
import 'style.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home), title: Text("Products")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search), title: Text("Search")),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart), title: Text("Cart")),
      ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ProductListTab());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: SearchTab());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(child: ShoppingCartTab());
            });
          default:
        }
        return null;
      },
    );
  }
}
