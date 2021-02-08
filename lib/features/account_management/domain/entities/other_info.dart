class OtherInfo {
  String senderAccount;
  double userLatitude;
  double userLogintude;
  String description;
  String cupom;

  OtherInfo({this.senderAccount, this.description, this.cupom, this.userLatitude, this.userLogintude});

  bool showCupom() => cupom != null && cupom.isNotEmpty;
  bool showLocation() => userLatitude != null && userLogintude != null;

  String formartCupom() => cupom.replaceAll("@", '\n');
}
