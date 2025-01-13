enum TodoCategory {
  personal,
  work,
  ;

  @override
  String toString() {
    return name;
  }
}

TodoCategory mapToTodoCategory(String name) {
  switch (name) {
    case 'personal':
      return TodoCategory.personal;
    case 'work':
      return TodoCategory.work;
    default:
      return TodoCategory.personal;
  }
}
