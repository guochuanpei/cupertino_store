import 'package:cupertino_store/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'model/app_state_model.dart';
import 'product_row_item.dart';
import 'style.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() {
    return _SearchTabState();
  }
}

class _SearchTabState extends State<SearchTab> {
  String _terms = '';
  TextEditingController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController()..addListener(_onTextChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    _controller.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _terms = _controller.text;
    });
  }

  Widget _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SearchBar(
        controller: _controller,
        focusNode: _focusNode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppStateModel>(context);
    final results = model.search(_terms);

    return DecoratedBox(
      decoration: const BoxDecoration(color: Styles.scaffoldBackground),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _buildSearchBox(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => ProductRowItem(
                  product: results[index],
                  index: index,
                  lastItem: index == results.length - 1,
                ),
                itemCount: results.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
