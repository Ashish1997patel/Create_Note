class Userlist {
  String? responseCode;
  String? message;
  Result? result;

  Userlist({this.responseCode, this.message, this.result});

  Userlist.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  List<User>? user;

  Result({this.user});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? userId;
  String? userName;
  String? userFirstName;
  String? userMiddleName;
  String? userLastName;
  String? userMobile;
  String? userEmail;
  String? userDOB;
  String? userDisplayDOB;
  String? userDOA;
  String? userDisplayDOA;
  String? userDesignation;
  String? userToken;
  String? userProfileImageUrl;
  String? userLoginStatusId;
  String? isEmployee;
  String? userSignatureImageUrl;
  String? authenticateEmail;
  String? authenticateMobile;

  User(
      {this.userId,
        this.userName,
        this.userFirstName,
        this.userMiddleName,
        this.userLastName,
        this.userMobile,
        this.userEmail,
        this.userDOB,
        this.userDisplayDOB,
        this.userDOA,
        this.userDisplayDOA,
        this.userDesignation,
        this.userToken,
        this.userProfileImageUrl,
        this.userLoginStatusId,
        this.isEmployee,
        this.userSignatureImageUrl,
        this.authenticateEmail,
        this.authenticateMobile});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userName = json['userName'];
    userFirstName = json['userFirstName'];
    userMiddleName = json['userMiddleName'];
    userLastName = json['userLastName'];
    userMobile = json['userMobile'];
    userEmail = json['userEmail'];
    userDOB = json['userDOB'];
    userDisplayDOB = json['userDisplayDOB'];
    userDOA = json['userDOA'];
    userDisplayDOA = json['userDisplayDOA'];
    userDesignation = json['userDesignation'];
    userToken = json['userToken'];
    userProfileImageUrl = json['userProfileImageUrl'];
    userLoginStatusId = json['userLoginStatusId'];
    isEmployee = json['isEmployee'];
    userSignatureImageUrl = json['userSignatureImageUrl'];
    authenticateEmail = json['authenticateEmail'];
    authenticateMobile = json['authenticateMobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userFirstName'] = this.userFirstName;
    data['userMiddleName'] = this.userMiddleName;
    data['userLastName'] = this.userLastName;
    data['userMobile'] = this.userMobile;
    data['userEmail'] = this.userEmail;
    data['userDOB'] = this.userDOB;
    data['userDisplayDOB'] = this.userDisplayDOB;
    data['userDOA'] = this.userDOA;
    data['userDisplayDOA'] = this.userDisplayDOA;
    data['userDesignation'] = this.userDesignation;
    data['userToken'] = this.userToken;
    data['userProfileImageUrl'] = this.userProfileImageUrl;
    data['userLoginStatusId'] = this.userLoginStatusId;
    data['isEmployee'] = this.isEmployee;
    data['userSignatureImageUrl'] = this.userSignatureImageUrl;
    data['authenticateEmail'] = this.authenticateEmail;
    data['authenticateMobile'] = this.authenticateMobile;
    return data;
  }
}
