class HomeEstateApiModel {
  List<Listings>? listings;

  HomeEstateApiModel({this.listings});

  HomeEstateApiModel.fromJson(Map<String, dynamic> json) {
    if (json['listings'] != null) {
      listings = <Listings>[];
      json['listings'].forEach((v) {
        listings!.add(new Listings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listings != null) {
      data['listings'] = this.listings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Listings {
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
  Null? deletedAt;
  Null? soldAt;
  String? latitude;
  String? longitude;
  List<Images>? images;

  Listings(
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
      this.longitude,
      this.images});

  Listings.fromJson(Map<String, dynamic> json) {
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
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? filename;
  int? listingId;
  String? src;

  Images(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.filename,
      this.listingId,
      this.src});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    filename = json['filename'];
    listingId = json['listing_id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['filename'] = this.filename;
    data['listing_id'] = this.listingId;
    data['src'] = this.src;
    return data;
  }
