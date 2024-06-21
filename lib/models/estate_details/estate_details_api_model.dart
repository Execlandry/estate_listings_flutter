class EstateDetailsApiModel {
  Listing? listing;
  OfferMade? offerMade;

  EstateDetailsApiModel({this.listing, this.offerMade});

  factory EstateDetailsApiModel.fromJson(Map<String, dynamic> json) {
    return EstateDetailsApiModel(
      listing: json['listing'] != null ? Listing.fromJson(json['listing']) : null,
      offerMade: json['offerMade'] != null ? OfferMade.fromJson(json['offerMade']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listing != null) {
      data['listing'] = listing!.toJson();
    }
    if (offerMade != null) {
      data['offerMade'] = offerMade!.toJson();
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
  String? deletedAt;
  String? soldAt;
  String? latitude;
  String? longitude;
  List<Images>? images;

  Listing({
    this.id,
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
    this.images,
  });

  factory Listing.fromJson(Map<String, dynamic> json) {
    return Listing(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      beds: json['beds'],
      baths: json['baths'],
      area: json['area'],
      city: json['city'],
      code: json['code'],
      street: json['street'],
      streetNr: json['street_nr'],
      price: json['price'],
      byUserId: json['by_user_id'],
      deletedAt: json['deleted_at'],
      soldAt: json['sold_at'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      images: (json['images'] as List<dynamic>?)
          ?.map((item) => Images.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['beds'] = beds;
    data['baths'] = baths;
    data['area'] = area;
    data['city'] = city;
    data['code'] = code;
    data['street'] = street;
    data['street_nr'] = streetNr;
    data['price'] = price;
    data['by_user_id'] = byUserId;
    data['deleted_at'] = deletedAt;
    data['sold_at'] = soldAt;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (images != null) {
      data['images'] = images!.map((image) => image.toJson()).toList();
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

  Images({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.filename,
    this.listingId,
    this.src,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      filename: json['filename'],
      listingId: json['listing_id'],
      src: json['src'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['filename'] = filename;
    data['listing_id'] = listingId;
    data['src'] = src;
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
  String? acceptedAt;
  String? rejectedAt;

  OfferMade({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.listingId,
    this.bidderId,
    this.amount,
    this.acceptedAt,
    this.rejectedAt,
  });

  factory OfferMade.fromJson(Map<String, dynamic> json) {
    return OfferMade(
      id: json['id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      listingId: json['listing_id'],
      bidderId: json['bidder_id'],
      amount: json['amount'],
      acceptedAt: json['accepted_at'],
      rejectedAt: json['rejected_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['listing_id'] = listingId;
    data['bidder_id'] = bidderId;
    data['amount'] = amount;
    data['accepted_at'] = acceptedAt;
    data['rejected_at'] = rejectedAt;
    return data;
  }
}
