class UserListModel {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? beds;
  int? baths;
  int? area;
  String? city;
  String? code;
  String? street;
  String? streetNr;
  int? price;
  int? byUserId;
  DateTime? deletedAt;
  DateTime? soldAt;
  String? latitude;
  String? longitude;

  UserListModel(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.beds,
      this.baths,
      this.area,
      this.city,
      this.code,
      this.street,
      this.streetNr,
      this.price,
      this.byUserId,
      this.deletedAt,
      this.soldAt,
      this.latitude,
      this.longitude});

  UserListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    beds = json['beds'];
    baths = json['baths'];
    area = json['area'];
    city = json['city'];
    code = json['code'];
    street = json['street'];
    streetNr = json['street_nr'];
    price = json['price'];
    byUserId = json['by_user_id'];
    deletedAt = json['deleted_at'];
    soldAt = json['sold_at'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['beds'] = this.beds;
    data['baths'] = this.baths;
    data['area'] = this.area;
    data['city'] = this.city;
    data['code'] = this.code;
    data['street'] = this.street;
    data['street_nr'] = this.streetNr;
    data['price'] = this.price;
    data['by_user_id'] = this.byUserId;
    data['deleted_at'] = this.deletedAt;
    data['sold_at'] = this.soldAt;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
