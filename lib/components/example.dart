import 'package:flutter/material.dart';

class DoubleDropdown extends StatefulWidget {
  final Map<String, List<String>> items;
  final ValueChanged<String> onChangedFirst;
  final ValueChanged<String> onChangedSecond;

  DoubleDropdown({
    @required this.items,
    @required this.onChangedFirst,
    @required this.onChangedSecond,
  });

  @override
  _DoubleDropdownState createState() => _DoubleDropdownState();
}

class _DoubleDropdownState extends State<DoubleDropdown> {
  String selectedKey;

  @override
  void initState() {
    super.initState();
    selectedKey = widget.items.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFirstDropdown(),
        _buildSecondDowndown(),
      ],
    );
  }

  Widget _buildFirstDropdown() => DropdownButtonFormField<String>(
        items: widget.items.keys.map((e) {
          return DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          );
        }).toList(),
        onChanged: (val) {
          setState(() => selectedKey = val);
          widget.onChangedFirst(val);
        },
        value: selectedKey,
      );

  Widget _buildSecondDowndown() => DropdownButtonFormField<String>(
        items: widget.items[selectedKey].map((e) {
          return DropdownMenuItem<String>(
            child: Text(e),
            value: e,
          );
        }).toList(),
        onChanged: widget.onChangedSecond,
        value: widget.items[selectedKey].first,
      );
}
