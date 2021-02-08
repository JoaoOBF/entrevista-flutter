import 'package:myapp/features/account_management/domain/entities/other_info.dart';

class OtherInfoModel extends OtherInfo {
  String senderAccount;
  double userLatitude;
  double userLongitude;
  String description;
  String cupom;

  OtherInfoModel({this.senderAccount, this.description, this.userLongitude, this.userLatitude, this.cupom})
      : super(
          description: description,
          senderAccount: senderAccount,
          userLatitude:userLatitude,
          userLogintude:userLongitude,
          cupom:cupom,
        );

  factory OtherInfoModel.fromJson(Map<String, dynamic> json) {
    return OtherInfoModel(
      senderAccount: json['senderAccount'],
      description: json['description'],
      userLatitude: json['userLatitude'],
      userLongitude: json['userLongitude'],
      cupom: json['cupom'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderAccount'] = this.senderAccount;
    data['description'] = this.description;
    return data;
  }
}
