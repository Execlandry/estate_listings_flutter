class HomeListFilterModel {
  Filters? filters;
  Listings? listings;

  HomeListFilterModel({this.filters, this.listings});

  HomeListFilterModel.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? new Filters.fromJson(json['filters']) : null;
    listings = json['listings'] != null
        ? new Listings.fromJson(json['listings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.filters != null) {
      data['filters'] = this.filters!.toJson();
    }
    if (this.listings != null) {
      data['listings'] = this.listings!.toJson();
    }
    return data;
  }
}

class Filters {
  String? priceFrom;
  Null? priceTo;
  String? beds;
  String? baths;
  Null? areaFrom;
  Null? areaTo;

  Filters(
      {this.priceFrom,
      this.priceTo,
      this.beds,
      this.baths,
      this.areaFrom,
      this.areaTo});

  Filters.fromJson(Map<String, dynamic> json) {
    priceFrom = json['priceFrom'];
    priceTo = json['priceTo'];
    beds = json['beds'];
    baths = json['baths'];
    areaFrom = json['areaFrom'];
    areaTo = json['areaTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['priceFrom'] = this.priceFrom;
    data['priceTo'] = this.priceTo;
    data['beds'] = this.beds;
    data['baths'] = this.baths;
    data['areaFrom'] = this.areaFrom;
    data['areaTo'] = this.areaTo;
    return data;
  }
}

class Listings {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Listings(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Listings.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
