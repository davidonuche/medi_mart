import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserInfoData extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String uid;

  @HiveField(4)
  final String timejoined;

  @HiveField(5)
  final bool isVerified;

  @HiveField(6)
  final String password;

  @HiveField(7)
  final String city;

  @HiveField(8)
  final String country;

  @HiveField(9)
  final String orgName;

  @HiveField(10)
  final String orgAddr;

  @HiveField(11)
  final String orgPhn;

  @HiveField(12)
  final String orgRcno;

  @HiveField(13)
  final String phone;

  @HiveField(14)
  final List<String> documents;

  @HiveField(15)
  final String bankName;

  @HiveField(16)
  final String accountNumber;

  @HiveField(17)
  final String accountName;

  const UserInfoData({
    this.name = '',
    this.email = '',
    this.type = '',
    this.uid = '',
    this.isVerified = false,
    this.timejoined = '',
    this.password = '',
    this.city = '-',
    this.country = '-',
    this.orgName = '',
    this.orgAddr = '',
    this.orgPhn = '',
    this.orgRcno = '',
    this.phone = '',
    this.documents = const [],
    this.bankName = '',
    this.accountNumber = '',
    this.accountName = '',
  });

  UserInfoData copyWith({
    String? name,
    String? email,
    String? type,
    String? uid,
    String? password,
    String? timejoined,
    String? city,
    String? country,
    bool? isVerified,
    String? orgName,
    String? orgAddr,
    String? orgPhn,
    String? orgRcno,
    String? phone,
    List<String>? documents,
    String? bankName,
    String? accountNumber,
    String? accountName,
  }) {
    return UserInfoData(
      name: name ?? this.name,
      email: email ?? this.email,
      type: type ?? this.type,
      uid: uid ?? this.uid,
      city: city ?? '-',
      country: country ?? '-',
      password: password ?? this.password,
      timejoined: timejoined ?? this.timejoined,
      isVerified: isVerified ?? false,
      accountName: accountName ?? this.accountName,
      accountNumber: accountNumber ?? this.accountNumber,
      bankName: bankName ?? this.bankName,
      documents: documents ?? this.documents,
      phone: phone ?? this.phone,
      orgAddr: orgAddr ?? this.orgAddr,
      orgName: orgName ?? this.orgName,
      orgPhn: orgPhn ?? this.orgPhn,
      orgRcno: orgRcno ?? this.orgRcno,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        type,
        uid,
        timejoined,
        isVerified,
        password,
        city,
        country,
        accountName,
        accountNumber,
        bankName,
        documents,
        phone,
        orgAddr,
        orgName,
        orgPhn,
        orgRcno,
      ];
}
