import 'package:flutter/foundation.dart';

@immutable
class UserModel {
  final String email;
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String country;
  final String state;
  final String city;
  final bool maternalStatus;
  final String inviterCode;
  final String vmommaCode;
  final List<String> connections;
  final List<String> connected;
  final int numberOfKids;
  final List<String> interests;
  final String profilePic;
  final String uid;
  final String bioData;
  final bool isMentor;
  const UserModel({
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.country,
    required this.state,
    required this.city,
    required this.maternalStatus,
    required this.inviterCode,
    required this.vmommaCode,
    required this.connections,
    required this.connected,
    required this.numberOfKids,
    required this.interests,
    required this.profilePic,
    required this.uid,
    required this.bioData,
    required this.isMentor,
  });

  // const UserModel(

  UserModel copyWith({
    String? email,
    String? firstname,
    String? lastname,
    String? phonenumber,
    String? country,
    String? state,
    String? city,
    bool? maternalStatus,
    String? inviterCode,
    String? vmommaCode,
    List<String>? connections,
    List<String>? connected,
    int? numberOfKids,
    List<String>? interests,
    String? profilePic,
    String? uid,
    String? bioData,
    bool? isMentor,
  }) {
    return UserModel(
      email: email ?? this.email,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phonenumber: phonenumber ?? this.phonenumber,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
      maternalStatus: maternalStatus ?? this.maternalStatus,
      inviterCode: inviterCode ?? this.inviterCode,
      vmommaCode: vmommaCode ?? this.vmommaCode,
      connections: connections ?? this.connections,
      connected: connected ?? this.connected,
      numberOfKids: numberOfKids ?? this.numberOfKids,
      interests: interests ?? this.interests,
      profilePic: profilePic ?? this.profilePic,
      uid: uid ?? this.uid,
      bioData: bioData ?? this.bioData,
      isMentor: isMentor ?? this.isMentor,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'firstname': firstname});
    result.addAll({'lastname': lastname});
    result.addAll({'phonenumber': phonenumber});
    result.addAll({'profilePic': profilePic});
    result.addAll({'country': country});
    result.addAll({'state': state});
    result.addAll({'city': city});
    result.addAll({'maternalStatus': maternalStatus});
    result.addAll({'inviterCode': inviterCode});
    result.addAll({'vmommaCode': vmommaCode});
    result.addAll({'connections': connections});
    result.addAll({'connected': connected});
    result.addAll({'numberOfKids': numberOfKids});
    result.addAll({'interests': interests});
    //  result.addAll({'uid': uid});
    result.addAll({'bioData': bioData});
    result.addAll({'isMentor': isMentor});

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] ?? '',
      firstname: map['firstname'] ?? '',
      lastname: map['lastname'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      profilePic: map['profilePic'] ?? '',
      country: map['country'] ?? '',
      state: map['state'] ?? '',
      city: map['city'] ?? '',
      maternalStatus: map['maternalStatus'] ?? '',
      inviterCode: map['inviterCode'] ?? '',
      vmommaCode: map['vmommaCode'] ?? false,
      connections: List<String>.from(map['connections']),
      connected: List<String>.from(map['connected']),
      interests: List<String>.from(map['interests']),
      numberOfKids: map['profilePic'] ?? 0,
      bioData: map['bioData'] ?? '',
      uid: map['\$id'] ?? '',
      isMentor: map['isMentor'] ?? false,
    );
  }

  @override
  String toString() {
    return 'UserModel(email: $email, firstname: $firstname, lastname: $lastname, phonenumber: $phonenumber, country: $country, state: $state, city: $city, maternalStatus: $maternalStatus, inviterCode: $inviterCode, vmommaCode: $vmommaCode, connections: $connections, connected: $connected, numberOfKids: $numberOfKids, interests: $interests, profilePic: $profilePic, uid: $uid, bioData: $bioData, isMentor: $isMentor)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.phonenumber == phonenumber &&
        other.country == country &&
        other.state == state &&
        other.city == city &&
        other.maternalStatus == maternalStatus &&
        other.inviterCode == inviterCode &&
        other.vmommaCode == vmommaCode &&
        listEquals(other.connections, connections) &&
        listEquals(other.connected, connected) &&
        other.numberOfKids == numberOfKids &&
        listEquals(other.interests, interests) &&
        other.profilePic == profilePic &&
        other.uid == uid &&
        other.bioData == bioData &&
        other.isMentor == isMentor;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        phonenumber.hashCode ^
        country.hashCode ^
        state.hashCode ^
        city.hashCode ^
        maternalStatus.hashCode ^
        inviterCode.hashCode ^
        vmommaCode.hashCode ^
        connections.hashCode ^
        connected.hashCode ^
        numberOfKids.hashCode ^
        interests.hashCode ^
        profilePic.hashCode ^
        uid.hashCode ^
        bioData.hashCode ^
        isMentor.hashCode;
  }
}
