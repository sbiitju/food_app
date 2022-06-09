class Person {
  final int id;
  final String name;
  final int age;

  Person(this.id, this.name, this.age);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}
