class UserLoginApiModel {
  String? accessToken;
  String? tokenType;
  bool? isLogin;

  UserLoginApiModel({this.accessToken, this.tokenType, this.isLogin});

  UserLoginApiModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['isLogin'] = isLogin;

    return data;
  }
}
