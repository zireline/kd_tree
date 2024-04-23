import 'dart:math';

import 'package:test/test.dart';
import 'package:kd_tree/kd_tree.dart';

void main() {
  test('KDTree range search', () {
    // Arrange
    List<Point> points = [
      Point(1, 1),
      Point(2, 2),
      Point(3, 3),
      Point(4, 4),
      Point(5, 5),
    ];
    KDTree tree = KDTree(points);

    // Act
    List<Point> result = tree.rangeSearch(Point(3, 3), 2);

    // Assert
    expect(result.length, 3);
    expect(result, contains(Point(2, 2)));
    expect(result, contains(Point(3, 3)));
    expect(result, contains(Point(4, 4)));
  });
}
