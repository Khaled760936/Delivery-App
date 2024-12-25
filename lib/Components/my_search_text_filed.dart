import 'package:flutter/material.dart';
import 'package:test/Components/my_item.dart';
import 'package:test/Components/my_items_list.dart';

class MySearchTextField extends StatefulWidget {
  const MySearchTextField({super.key});

  @override
  State<MySearchTextField> createState() => _MySearchTextFieldState();
}

class _MySearchTextFieldState extends State<MySearchTextField> {
  final TextEditingController _controller = TextEditingController();
  List<Item> _filteredItems = [];
  bool _showSuggestions = false;

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = [];
        _showSuggestions = false;
      });
    } else {
      setState(() {
        _filteredItems = items
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
        _showSuggestions = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          onChanged: _filterItems,
          decoration: InputDecoration(
            hintText: 'Enter item name',
            label: Text(
              'Search for shops & items',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
            ),
            suffixIconColor: Theme.of(context).colorScheme.inversePrimary,
            suffixIcon: const Icon(
              Icons.search,
              size: 20,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(),
          ),
        ),
        if (_showSuggestions)
          SizedBox(
            height: 200, // Maximum height for the dropdown
            child: Container(
              margin: const EdgeInsets.only(top: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index].name),
                    onTap: () {
                      setState(() {
                        _controller.text = _filteredItems[index].name;
                        _showSuggestions = false;
                      });
                    },
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
