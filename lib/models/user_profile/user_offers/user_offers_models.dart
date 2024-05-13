class UserOffersModel {
  Listing? listing;

  UserOffersModel({this.listing});

  UserOffersModel.fromJson(Map<String, dynamic> json) {
    listing =
        json['listing'] != null ? new Listing.fromJson(json['listing']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listing != null) {
      data['listing'] = this.listing!.toJson();
    }
    return data;
  }
}

class Listing {
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
  List<Offers>? offers;

  Listing(
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
      this.offers});

  Listing.fromJson(Map<String, dynamic> json) {
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
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(new Offers.fromJson(v));
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
    if (this.offers != null) {
      data['offers'] = this.offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? listingId;
  int? bidderId;
  int? amount;
  Null? acceptedAt;
  Null? rejectedAt;
  Bidder? bidder;

  Offers(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.listingId,
      this.bidderId,
      this.amount,
      this.acceptedAt,
      this.rejectedAt,
      this.bidder});

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    listingId = json['listing_id'];
    bidderId = json['bidder_id'];
    amount = json['amount'];
    acceptedAt = json['accepted_at'];
    rejectedAt = json['rejected_at'];
    bidder =
        json['bidder'] != null ? new Bidder.fromJson(json['bidder']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['listing_id'] = this.listingId;
    data['bidder_id'] = this.bidderId;
    data['amount'] = this.amount;
    data['accepted_at'] = this.acceptedAt;
    data['rejected_at'] = this.rejectedAt;
    if (this.bidder != null) {
      data['bidder'] = this.bidder!.toJson();
    }
    return data;
  }
}

class Bidder {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  int? isAdmin;

  Bidder(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.isAdmin});

  Bidder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['is_admin'] = this.isAdmin;
    return data;
  }
}
