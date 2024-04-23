import 'dart:math';

import 'package:kd_tree/node.dart';

class KDTree {
  Node? root;

  KDTree(List<Point> points) {
    root = buildTree(points, 0);
  }

  Node? buildTree(List<Point> points, int depth) {
    if (points.isEmpty) {
      return null;
    }

    // sort by current dimensions
    points.sort(
      (a, b) => depth % 2 == 0 ? a.x.compareTo(b.x) : a.y.compareTo(b.y),
    );

    // find midian
    int medianIndex = points.length ~/ 2;
    Node node = Node(points[medianIndex], depth);

    // build left and right subtrees
    List<Point> leftPoints = points.sublist(0, medianIndex);
    List<Point> rightPoints = points.sublist(medianIndex + 1);
    node.left = buildTree(leftPoints, depth + 1);
    node.right = buildTree(rightPoints, depth + 1);

    return node;
  }

  List<Point> rangeSearch(Point center, double radius) {
    List<Point> result = [];
    rangeSearchRecursive(root, center, radius, result);
    return result;
  }

  void rangeSearchRecursive(
    Node? node,
    Point center,
    double radius,
    List<Point> result,
  ) {
    if (node == null) {
      return;
    }

    double distance = node.point.distanceTo(center);
    if (distance <= radius) {
      result.add(node.point);
    }

    int currentDimension = node.depth % 2;
    if (currentDimension == 0) {
      if (center.x - radius <= node.point.x) {
        rangeSearchRecursive(node.left, center, radius, result);
      }

      if (center.x + radius >= node.point.x) {
        rangeSearchRecursive(node.right, center, radius, result);
      }
    } else {
      if (center.y - radius <= node.point.y) {
        rangeSearchRecursive(node.left, center, radius, result);
      }

      if (center.y + radius >= node.point.y) {
        rangeSearchRecursive(node.right, center, radius, result);
      }
    }
  }
}
