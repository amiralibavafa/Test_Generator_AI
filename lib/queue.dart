//package:sample_project/queue.dart

class Queue<T> {
  final List<T> _items = [];

  void enqueue(T item) {
    _items.add(item);
  }

  T? dequeue() {
    if (isEmpty) {
      return null;
    }
    return _items.removeAt(0);
  }

  T? peek() {
    if (isEmpty) {
      return null;
    }
    return _items.first;
  }

  bool get isEmpty => _items.isEmpty;

  int get length => _items.length;

  List<T> toList() {
    return List.from(_items);
  }

  @override
  String toString() {
    return _items.toString();
  }
}