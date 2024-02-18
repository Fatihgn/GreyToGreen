abstract class User {
  const User({
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
  });
  final String name;
  final String email;
  final int age;
  final String gender;
}
