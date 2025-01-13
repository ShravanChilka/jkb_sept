enum TodoStatus {
  pending,
  completed,
  ;

  @override
  String toString() {
    return name;
  }
}

TodoStatus mapToTodoStatus(String name) {
  switch (name) {
    case 'pending':
      return TodoStatus.pending;
    case 'completed':
      return TodoStatus.completed;
    default:
      return TodoStatus.pending;
  }
}
