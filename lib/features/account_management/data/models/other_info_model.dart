import 'package:myapp/features/account_management/domain/entities/other_info.dart';

class OtherInfoModel extends OtherInfo {
  String senderAccount;
  String description;

  OtherInfoModel({this.senderAccount, this.description})
      : super(
          description: description,
          senderAccount: senderAccount,
        );

  factory OtherInfoModel.fromJson(Map<String, dynamic> json) {
    return OtherInfoModel(
      senderAccount: json['senderAccount'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['senderAccount'] = this.senderAccount;
    data['description'] = this.description;
    return data;
  }
}
