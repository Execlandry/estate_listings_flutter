class EstateDetailsApiModel {
  Listing? listing;
  OfferMade? offerMade;

  EstateDetailsApiModel({this.listing, this.offerMade});

  EstateDetailsApiModel.fromJson(Map<String, dynamic> json) {
    listing =
        json['listing'] != null ? new Listing.fromJson(json['listing']) : null;
    offerMade = json['offerMade'] != null
        ? new OfferMade.fromJson(json['offerMade'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listing != null) {
      data['listing'] = this.listing!.toJson();
    }
    if (this.offerMade != null) {
      data['offerMade'] = this.offerMade!.toJson();
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
  List<Images>? images;

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
      this.images});

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
}

class OfferMade {
  int? id;
  String? createdAt;
  String? updatedAt;
  int? listingId;
  int? bidderId;
  int? amount;
  Null? acceptedAt;
  Null? rejectedAt;

  OfferMade(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.listingId,
      this.bidderId,
      this.amount,
      this.acceptedAt,
      this.rejectedAt});

  OfferMade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    listingId = json['listing_id'];
    bidderId = json['bidder_id'];
    amount = json['amount'];
    acceptedAt = json['accepted_at'];
    rejectedAt = json['rejected_at'];
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
    return data;
  }
}
