import 'package:flint_dart/model.dart';
import 'package:flint_dart/schema.dart';

class User extends Model<User> {
  @override
  String? id; // 🚀 Framework automatically manages: id, created_at, updated_at

  // Define your custom fields here
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? phone;
  String? gender;
  String? customer;
  String? profilePicUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  Table get table => Table(
        name: 'users',
        columns: [
          // 💡 Only define custom fields - id/created_at/updated_at are auto-added
          Column(
            name: 'name',
            type: ColumnType.string,
          ),
          Column(name: 'email', type: ColumnType.string, isUnique: true),
          Column(name: 'password', type: ColumnType.string),
          Column(name: 'phone', type: ColumnType.string, isNullable: true),
          Column(name: 'gender', type: ColumnType.string, isNullable: true),
          Column(
              name: 'role', type: ColumnType.string, defaultValue: 'customer'),
        ],
      );

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'profilePicUrl': profilePicUrl,
        'phone': phone,
        'gender': gender,
        'customer': customer,
        "created_at": createdAt,
        "updated_at": updatedAt
      };

  @override
  User fromMap(Map<dynamic, dynamic> map) {
    return User()
      ..id = map['id']
      ..name = map['name']
      ..email = map['email']
      ..password = map['password']
      ..phone = map['phone']
      ..customer = map['customer']
      ..gender = map['gender']
      ..createdAt = map["created_at"]
      ..updatedAt = map["updated_at"];
  }
}
