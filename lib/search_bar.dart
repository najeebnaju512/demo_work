import 'package:flutter/material.dart';

import 'main.dart';

class SearchWidget extends StatefulWidget {
  final String? hintText;
  const SearchWidget({super.key, this.hintText});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SearchAnchor(
        builder: (context, controller) {
          return SearchBar(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
            controller: controller,
            leading: const Icon(Icons.search),
            hintText: widget.hintText,
            hintStyle:
                WidgetStateProperty.all(Theme.of(context).textTheme.titleSmall),
            onTap: () {
              if (controller.text.isNotEmpty) {
                controller.openView();
              }
            },
            onChanged: (value) {
              setState(() {
                controller.openView();
              });
            },
          );
        },
        suggestionsBuilder: (context, controller) {
          List<Widget> matchingItems = [];
          for (var item in suggestions) {
            if (item.firstname
                .toLowerCase()
                .contains(controller.text.toLowerCase())) {
              matchingItems.add(
                ListTile(
                  title: Text(item.firstname),
                  onTap: () {
                    setState(() {
                      controller.closeView(item.firstname);
                    });
                  },
                ),
              );
            }
          }

          if (matchingItems.isEmpty && controller.text.isNotEmpty) {
            // If no items match the search text, show a "Nothing found" message
            return [const Text("Nothing found")];
          } else {
            // Otherwise, show the matching items
            return matchingItems;
          }
        },
      ),
    );
  }
}
