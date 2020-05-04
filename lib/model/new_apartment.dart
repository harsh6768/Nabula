class NewApartment {
  String id;
  String imageUrl;
  String villaName;
  String price;
  String location;
  String area;
  int roomCount;
  int poolCount;
  int stairsCount;
  int vehicleCount;
  bool forSale;

  NewApartment(
      {this.id,
      this.imageUrl,
      this.villaName,
      this.price,
      this.location,
      this.area,
      this.roomCount,
      this.poolCount,
      this.stairsCount,
      this.vehicleCount,
      this.forSale});

  NewApartment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    villaName = json['villa_name'];
    price = json['price'];
    location = json['location'];
    area = json['area'];
    roomCount = json['room_count'];
    poolCount = json['pool_count'];
    stairsCount = json['stairs_count'];
    vehicleCount = json['vehicle_count'];
    forSale = json['for_sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['villa_name'] = this.villaName;
    data['price'] = this.price;
    data['location'] = this.location;
    data['area'] = this.area;
    data['room_count'] = this.roomCount;
    data['pool_count'] = this.poolCount;
    data['stairs_count'] = this.stairsCount;
    data['vehicle_count'] = this.vehicleCount;
    data['for_sale'] = this.forSale;
    return data;
  }
}