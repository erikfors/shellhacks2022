import 'package:equatable/equatable.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class User extends Equatable {
  final String? email;
  final String id;
  final String? name;
  final String? photo;
  final String? phoneNumber;
  final int? zipCode;

  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.phoneNumber,
    this.zipCode,
  });

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [email, id, name, photo, phoneNumber, zipCode];

  static User fromJson(decode) {
    return User(
      id: decode['id'],
      email: decode['email'],
      name: decode['name'],
      photo: decode['photo'],
      phoneNumber: decode['phoneNumber'],
      zipCode: decode['zipCode'],
    );
  }
}
