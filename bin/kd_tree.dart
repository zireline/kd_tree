import 'dart:math';

import 'package:kd_tree/kd_tree.dart';

void main(List<String> arguments) {
  List<Point> points = [Point(1, 2), Point(3, 4), Point(5, 6), Point(7, 8)];

  KDTree kdTree = KDTree(points);
  List<Point> rangeResults = kdTree.rangeSearch(Point(4, 4), 2.0);
  print('Points within range:');
  for (Point point in rangeResults) {
    print('(${point.x}, ${point.y})');
  }
}
