library flutter_any_scroll;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sticky_headers/sticky_headers.dart';

///Lets you scroll the list both horizontally and vertically.
//Takes a list of widget as a child.
class FlutterAnyScroll extends StatelessWidget {
  const FlutterAnyScroll({
    super.key,
    required this.children,
    required this.crossAxisCount,
    required this.mainAxisCount,
    required this.crossAxisSpacing,
    this.header,
  });

  ///Provide the list of widgets that you want to display
  final List<Widget> children;

  ///Appears on the top of the list view (Its sticky)
  final Widget? header;

  ///Number of columns
  final int crossAxisCount;

  ///Number of rows
  final double mainAxisCount;

  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView(
        children: [
          if (header != null) ...[
            StickyHeader(
              header: header!,
              content: _CoreContent(
                crossAxisCount: crossAxisCount,
                mainAxisCount: mainAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                children: children,
              ),
            ),
          ] else ...[
            _CoreContent(
              crossAxisCount: crossAxisCount,
              mainAxisCount: mainAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              children: children,
            )
          ]
        ],
      ),
    );
  }
}

class _CoreContent extends StatelessWidget {
  const _CoreContent({
    required this.crossAxisCount,
    required this.mainAxisCount,
    required this.crossAxisSpacing,
    required this.children,
  });

  final int crossAxisCount;
  final double mainAxisCount;
  final double crossAxisSpacing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 2,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            StaggeredGrid.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: mainAxisCount,
              crossAxisSpacing: crossAxisSpacing,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
