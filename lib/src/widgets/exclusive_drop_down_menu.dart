import 'package:flutter/material.dart';

class ExclusiveDropDownMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExclusiveDropDownMenuState();
}

class _ExclusiveDropDownMenuState extends State<ExclusiveDropDownMenu> {
  List _items = ['ITEM 1', 'ITEM 2', 'ITEM 3', 'ITEM 4'];

  static const String FIRSTPOSITION = 'FIRST';
  static const String SECONDPOSITION = 'SECOND';
  static const String THIRDPOSITION = 'THIRD';
  static const String FOURTHPOSITION = 'FOURTH';

  List<DropdownMenuItem<String>> _dropDownMenuItems;

  Map<String, dynamic> _tabItems = {
    FIRSTPOSITION: null,
    SECONDPOSITION: null,
    THIRDPOSITION: null,
    FOURTHPOSITION: null,
  };

  @override
  void initState() {
    _dropDownMenuItems = List();
    _initDropDownMenuItems();
    super.initState();
  }

  _initDropDownMenuItems() {
    for (String item in _items) {
      _dropDownMenuItems.add(DropdownMenuItem(
        value: item,
        child: Text(item),
      ));
    }
  }

  _updateTabItem(String tabItemPosition, String selectedItem) {
    // if selectedItem doesn't exist in the map, add it to the corresponding key
    if (!_tabItems.containsValue(selectedItem)) {
      _tabItems.update(tabItemPosition, (value) => (selectedItem));
    } else {
      // otherwise look for the key with value == selectedItem and set it to null
      _tabItems.forEach((k, v) {
        if (v == selectedItem) {
          print(_tabItems.update(k, (value) => (null)));
        }
      });
      // ...setta il nuovo item alla nuova key
      _tabItems.update(tabItemPosition, (value) => (selectedItem));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildExclusiveDropDownMenu();
  }

  Widget _buildExclusiveDropDownMenu() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('First position: '),
            DropdownButton(
                hint: Text('Choose option'),
                items: _dropDownMenuItems,
                onChanged: (selectedItem) {
                  setState(() {
                    _updateTabItem(FIRSTPOSITION, selectedItem);
                  });
                },
                value: _tabItems[FIRSTPOSITION])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Second position: '),
            DropdownButton(
                hint: Text('Choose option'),
                items: _dropDownMenuItems,
                onChanged: (selectedItem) {
                  setState(() {
                    _updateTabItem(SECONDPOSITION, selectedItem);
                  });
                },
                value: _tabItems[SECONDPOSITION])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Third position: '),
            DropdownButton(
                hint: Text('Choose option'),
                items: _dropDownMenuItems,
                onChanged: (selectedItem) {
                  setState(() {
                    _updateTabItem(THIRDPOSITION, selectedItem);
                  });
                },
                value: _tabItems[THIRDPOSITION])
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Fourth position: '),
            DropdownButton(
                hint: Text('Choose option'),
                items: _dropDownMenuItems,
                onChanged: (selectedItem) {
                  setState(() {
                    _updateTabItem(FOURTHPOSITION, selectedItem);
                  });
                },
                value: _tabItems[FOURTHPOSITION])
          ],
        )
      ],
    );
  }
}
