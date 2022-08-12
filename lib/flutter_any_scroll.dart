library flutter_any_scroll;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FlutterAnyScroll extends StatelessWidget {
  const FlutterAnyScroll({
    Key? key,
    required this.children,
    required this.crossAxisCount,
    required this.mainAxisCount,
    required this.crossAxisSpacing,
    this.header,
  }) : super(key: key);

  final List<Widget> children;
  final Widget? header;
  final int crossAxisCount;
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
              content: CoreContent(
                crossAxisCount: crossAxisCount,
                mainAxisCount: mainAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                children: children,
              ),
            ),
          ] else ...[
            CoreContent(
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

class CoreContent extends StatelessWidget {
  const CoreContent({
    Key? key,
    required this.crossAxisCount,
    required this.mainAxisCount,
    required this.crossAxisSpacing,
    required this.children,
  }) : super(key: key);

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
