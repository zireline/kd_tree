import 'dart:math';

class Node {
  Point point;
  int depth;
  Node? left, right;

  Node(this.point, this.depth);
}
