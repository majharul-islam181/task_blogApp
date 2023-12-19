
class SuccessModelDataUser {

  int? id;
  String? name;
  String? slug;
  String? picture;
  String? email;
  String? phone;
  String? emailVerifiedAt;
  String? balance;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;

  SuccessModelDataUser({
    this.id,
    this.name,
    this.slug,
    this.picture,
    this.email,
    this.phone,
    this.emailVerifiedAt,
    this.balance,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  SuccessModelDataUser.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    slug = json['slug']?.toString();
    picture = json['picture']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    balance = json['balance']?.toString();
    type = json['type']?.toString();
    status = json['status']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['picture'] = picture;
    data['email'] = email;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['balance'] = balance;
    data['type'] = type;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SuccessModelData {


  String? token;
  SuccessModelDataUser? user;

  SuccessModelData({
    this.token,
    this.user,
  });
  SuccessModelData.fromJson(Map<String, dynamic> json) {
    token = json['token']?.toString();
    user = (json['user'] != null) ? SuccessModelDataUser.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class SuccessModel {


  SuccessModelData? data;
  String? message;
  int? status;

  SuccessModel({
    this.data,
    this.message,
    this.status,
  });
  SuccessModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? SuccessModelData.fromJson(json['data']) : null;
    message = json['message']?.toString();
    status = json['status']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data!.toJson();
      data['message'] = message;
    data['status'] = status;
    return data;
  }
}
