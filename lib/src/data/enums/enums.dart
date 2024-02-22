enum UserType {
  customer._('Client'),
  business._('Business');

  final String name;

  const UserType._(this.name);
}
