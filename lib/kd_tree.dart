import 'dart:math';

import 'package:kd_tree/node.dart';

class KDTree {
  late Node root;

  KDTree(List<Point> points) {
    root = buildTree(points, 0);
  }

  Node buildTree(List<Point> points, int depth) {
    // Implementation of building the tree
    return Node(Point(1, 1), depth);
  }

  List<Point> rangeSearch(Point center, double radius) {
    // Implementation of range search
    return [];
  }
}
