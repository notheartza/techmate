// To parse this JSON data, do
//
//     final viewStore = viewStoreFromJson(jsonString);

import 'dart:convert';

ViewStore viewStoreFromJson(String str) => ViewStore.fromJson(json.decode(str));

String viewStoreToJson(ViewStore data) => json.encode(data.toJson());

class ViewStore {
  int status;
  int totalData;
  List<Store> store;

  ViewStore({
    this.status,
    this.totalData,
    this.store,
  });

  factory ViewStore.fromJson(Map<String, dynamic> json) => ViewStore(
    status: json["status"],
    totalData: json["Total_Data"],
    store: List<Store>.from(json["Message"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Total_Data": totalData,
    "Store": List<dynamic>.from(store.map((x) => x.toJson())),
  };
}

class Store {
  String storeId;
  String deviceId;
  String name;
  String companyName;
  String description;
  int price;
  int stock;
  int rating;
  String exImg;
  String typeStore;
  String timestamp;

  Store({
    this.storeId,
    this.deviceId,
    this.name,
    this.companyName,
    this.description,
    this.price,
    this.stock,
    this.rating,
    this.exImg,
    this.typeStore,
    this.timestamp,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    storeId: json["Store_ID"],
    deviceId: json["Device_ID"],
    name: json["Name"],
    companyName: json["CompanyName"],
    description: json["Description"],
    price: json["Price"],
    stock: json["Stock"],
    rating: json["rating"],
    exImg: json["ExImg"],
    typeStore: json["TypeStore"],
    timestamp: json["Timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "Store_ID": storeId,
    "Device_ID": deviceId,
    "Name": name,
    "Description": description,
    "Price": price,
    "Stock": stock,
    "rating": rating,
    "ExImg": exImg,
    "TypeStore": typeStore,
    "Timestamp": timestamp,
  };
}
