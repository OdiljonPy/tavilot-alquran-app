// import 'package:admin_desktop/src/models/data/price_data.dart';
//
// class ProductCalculateResponse {
//   ProductCalculateResponse({
//     this.timestamp,
//     this.status,
//     this.message,
//     this.data,
//   });
//
//   DateTime? timestamp;
//   bool? status;
//   String? message;
//   ProductCalculateResponseData? data;
//
//   ProductCalculateResponse copyWith({
//     DateTime? timestamp,
//     bool? status,
//     String? message,
//     ProductCalculateResponseData? data,
//   }) =>
//       ProductCalculateResponse(
//         timestamp: timestamp ?? this.timestamp,
//         status: status ?? this.status,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );
//
//   factory ProductCalculateResponse.fromJson(Map<String, dynamic> json) => ProductCalculateResponse(
//     timestamp: json["timestamp"] == null ? null : DateTime.tryParse(json["timestamp"])?.toLocal(),
//     status: json["status"],
//     message: json["message"],
//     data: json["data"] == null ? null : ProductCalculateResponseData.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "timestamp": timestamp?.toIso8601String(),
//     "status": status,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class ProductCalculateResponseData {
//   ProductCalculateResponseData({
//     this.status,
//     this.code,
//     this.data,
//     this.deliveryFee,
//     this.totalPrice,
//     this.serviceFee,
//     this.couponPrice,
//     this.totalDiscount
//   });
//
//   bool? status;
//   String? code;
//   PriceData? data;
//   num? deliveryFee;
//   num? totalPrice;
//   num? serviceFee;
//   num? couponPrice;
//   num? totalDiscount;
//
//   ProductCalculateResponseData copyWith({
//     bool? status,
//     String? code,
//     PriceData? data,
//     num? deliveryFee,
//     num? totalPrice,
//     num? serviceFee,
//     num? couponPrice,
//     num? totalDiscount,
//
//   }) =>
//       ProductCalculateResponseData(
//         status: status ?? this.status,
//         code: code ?? this.code,
//         data: data ?? this.data,
//         deliveryFee: deliveryFee ?? this.deliveryFee,
//         totalPrice: totalPrice ?? this.totalPrice,
//         serviceFee: serviceFee ?? this.serviceFee,
//         couponPrice: couponPrice ?? this.couponPrice,
//         totalDiscount: totalDiscount ?? this.totalDiscount,
//       );
//
//   factory ProductCalculateResponseData.fromJson(Map<String, dynamic> json) =>
//       ProductCalculateResponseData(
//         status: json["status"],
//         code: json["code"],
//         data: (json["shops"].isEmpty ??= true)
//             ? null
//             : PriceData.fromJson(json["shops"][0]),
//         deliveryFee: json["delivery_fee"],
//         totalPrice: json["total_price"],
//         serviceFee: json["service_fee"],
//         couponPrice: json["coupon_price"],
//         totalDiscount: json["total_discount"],
//
//       );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "code": code,
//     "delivery_fee": deliveryFee,
//     "total_price": totalPrice,
//     "service_fee": serviceFee,
//     "coupon_price": couponPrice,
//     "data": data?.toJson(),
//   };
// }
//
// // To parse this JSON data, do
// //
// //     final productCalculateResponse = productCalculateResponseFromJson(jsonString);
//
//
//
//
//
// // import 'dart:convert';
// //
// // import '../data/price_data.dart';
// //
// // ProductCalculateResponse productCalculateResponseFromJson(String str) => ProductCalculateResponse.fromJson(json.decode(str));
// //
// // String productCalculateResponseToJson(ProductCalculateResponse data) => json.encode(data.toJson());
// //
// // class ProductCalculateResponse {
// //   DateTime? timestamp;
// //   bool? status;
// //   String? message;
// //   PriceDate? data;
// //
// //   ProductCalculateResponse({
// //     this.timestamp,
// //     this.status,
// //     this.message,
// //     this.data,
// //   });
// //
// //   factory ProductCalculateResponse.fromJson(Map<String, dynamic> json) => ProductCalculateResponse(
// //     timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
// //     status: json["status"],
// //     message: json["message"],
// //     data: json["data"] == null ? null : PriceDate.fromJson(json["data"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "timestamp": timestamp?.toIso8601String(),
// //     "status": status,
// //     "message": message,
// //     "data": data?.toJson(),
// //   };
// // }
//
// // class PriceData {
// //   List<ShopElement>? shops;
// //   double? totalTax;
// //   int? price;
// //   double? totalPrice;
// //   int? serviceFee;
// //   int? totalDiscount;
// //   int? deliveryFee;
// //   int? rate;
// //   Coupon? coupon;
// //   double? couponPrice;
// //
// //   PriceData({
// //     this.shops,
// //     this.totalTax,
// //     this.price,
// //     this.totalPrice,
// //     this.serviceFee,
// //     this.totalDiscount,
// //     this.deliveryFee,
// //     this.rate,
// //     this.coupon,
// //     this.couponPrice,
// //   });
// //
// //   factory PriceData.fromJson(Map<String, dynamic> json) => PriceData(
// //     shops: json["shops"] == null ? [] : List<ShopElement>.from(json["shops"]!.map((x) => ShopElement.fromJson(x))),
// //     totalTax: json["total_tax"]?.toDouble(),
// //     price: json["price"],
// //     totalPrice: json["total_price"]?.toDouble(),
// //     serviceFee: json["service_fee"],
// //     totalDiscount: json["total_discount"],
// //     deliveryFee: json["delivery_fee"],
// //     rate: json["rate"],
// //     coupon: json["coupon"] == null ? null : Coupon.fromJson(json["coupon"]),
// //     couponPrice: json["coupon_price"]?.toDouble(),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "shops": shops == null ? [] : List<dynamic>.from(shops!.map((x) => x.toJson())),
// //     "total_tax": totalTax,
// //     "price": price,
// //     "total_price": totalPrice,
// //     "service_fee": serviceFee,
// //     "total_discount": totalDiscount,
// //     "delivery_fee": deliveryFee,
// //     "rate": rate,
// //     "coupon": coupon?.toJson(),
// //     "coupon_price": couponPrice,
// //   };
// // }
// //
// // class Coupon {
// //   int? id;
// //   String? name;
// //   String? type;
// //   int? qty;
// //   int? price;
// //   DateTime? expiredAt;
// //   dynamic img;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   String? couponFor;
// //
// //   Coupon({
// //     this.id,
// //     this.name,
// //     this.type,
// //     this.qty,
// //     this.price,
// //     this.expiredAt,
// //     this.img,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.couponFor,
// //   });
// //
// //   factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
// //     id: json["id"],
// //     name: json["name"],
// //     type: json["type"],
// //     qty: json["qty"],
// //     price: json["price"],
// //     expiredAt: json["expired_at"] == null ? null : DateTime.parse(json["expired_at"]),
// //     img: json["img"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     couponFor: json["for"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "name": name,
// //     "type": type,
// //     "qty": qty,
// //     "price": price,
// //     "expired_at": expiredAt?.toIso8601String(),
// //     "img": img,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "for": couponFor,
// //   };
// // }
// //
// // class ShopElement {
// //   int? price;
// //   int? totalPrice;
// //   double? tax;
// //   int? discount;
// //   List<StockElement>? stocks;
// //
// //   ShopElement({
// //     this.price,
// //     this.totalPrice,
// //     this.tax,
// //     this.discount,
// //     this.stocks,
// //   });
// //
// //   factory ShopElement.fromJson(Map<String, dynamic> json) => ShopElement(
// //     price: json["price"],
// //     totalPrice: json["total_price"],
// //     tax: json["tax"]?.toDouble(),
// //     discount: json["discount"],
// //     stocks: json["stocks"] == null ? [] : List<StockElement>.from(json["stocks"]!.map((x) => StockElement.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "price": price,
// //     "total_price": totalPrice,
// //     "tax": tax,
// //     "discount": discount,
// //     "stocks": stocks == null ? [] : List<dynamic>.from(stocks!.map((x) => x.toJson())),
// //   };
// // }
// //
// // class StockElement {
// //   int? id;
// //   int? shopId;
// //   int? price;
// //   int? productPrice;
// //   int? quantity;
// //   int? productQuantity;
// //   int? tax;
// //   int? discount;
// //   int? totalPrice;
// //   dynamic image;
// //   StockStock? stock;
// //
// //   StockElement({
// //     this.id,
// //     this.shopId,
// //     this.price,
// //     this.productPrice,
// //     this.quantity,
// //     this.productQuantity,
// //     this.tax,
// //     this.discount,
// //     this.totalPrice,
// //     this.image,
// //     this.stock,
// //   });
// //
// //   factory StockElement.fromJson(Map<String, dynamic> json) => StockElement(
// //     id: json["id"],
// //     shopId: json["shop_id"],
// //     price: json["price"],
// //     productPrice: json["product_price"],
// //     quantity: json["quantity"],
// //     productQuantity: json["product_quantity"],
// //     tax: json["tax"],
// //     discount: json["discount"],
// //     totalPrice: json["total_price"],
// //     image: json["image"],
// //     stock: json["stock"] == null ? null : StockStock.fromJson(json["stock"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "shop_id": shopId,
// //     "price": price,
// //     "product_price": productPrice,
// //     "quantity": quantity,
// //     "product_quantity": productQuantity,
// //     "tax": tax,
// //     "discount": discount,
// //     "total_price": totalPrice,
// //     "image": image,
// //     "stock": stock?.toJson(),
// //   };
// // }
// //
// // class StockStock {
// //   int? id;
// //   int? productId;
// //   int? price;
// //   int? quantity;
// //   dynamic bonusExpiredAt;
// //   dynamic discountExpiredAt;
// //   dynamic discountId;
// //   dynamic tax;
// //   dynamic img;
// //   dynamic createdAt;
// //   dynamic updatedAt;
// //   int? oCount;
// //   int? odCount;
// //   String? sku;
// //   Product? product;
// //   dynamic discount;
// //   List<dynamic>? galleries;
// //   List<StockExtra>? stockExtras;
// //
// //   StockStock({
// //     this.id,
// //     this.productId,
// //     this.price,
// //     this.quantity,
// //     this.bonusExpiredAt,
// //     this.discountExpiredAt,
// //     this.discountId,
// //     this.tax,
// //     this.img,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.oCount,
// //     this.odCount,
// //     this.sku,
// //     this.product,
// //     this.discount,
// //     this.galleries,
// //     this.stockExtras,
// //   });
// //
// //   factory StockStock.fromJson(Map<String, dynamic> json) => StockStock(
// //     id: json["id"],
// //     productId: json["product_id"],
// //     price: json["price"],
// //     quantity: json["quantity"],
// //     bonusExpiredAt: json["bonus_expired_at"],
// //     discountExpiredAt: json["discount_expired_at"],
// //     discountId: json["discount_id"],
// //     tax: json["tax"],
// //     img: json["img"],
// //     createdAt: json["created_at"],
// //     updatedAt: json["updated_at"],
// //     oCount: json["o_count"],
// //     odCount: json["od_count"],
// //     sku: json["sku"],
// //     product: json["product"] == null ? null : Product.fromJson(json["product"]),
// //     discount: json["discount"],
// //     galleries: json["galleries"] == null ? [] : List<dynamic>.from(json["galleries"]!.map((x) => x)),
// //     stockExtras: json["stock_extras"] == null ? [] : List<StockExtra>.from(json["stock_extras"]!.map((x) => StockExtra.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "product_id": productId,
// //     "price": price,
// //     "quantity": quantity,
// //     "bonus_expired_at": bonusExpiredAt,
// //     "discount_expired_at": discountExpiredAt,
// //     "discount_id": discountId,
// //     "tax": tax,
// //     "img": img,
// //     "created_at": createdAt,
// //     "updated_at": updatedAt,
// //     "o_count": oCount,
// //     "od_count": odCount,
// //     "sku": sku,
// //     "product": product?.toJson(),
// //     "discount": discount,
// //     "galleries": galleries == null ? [] : List<dynamic>.from(galleries!.map((x) => x)),
// //     "stock_extras": stockExtras == null ? [] : List<dynamic>.from(stockExtras!.map((x) => x.toJson())),
// //   };
// // }
// //
// // class Product {
// //   int? id;
// //   String? uuid;
// //   int? shopId;
// //   int? unitId;
// //   dynamic keywords;
// //   String? img;
// //   dynamic qrCode;
// //   int? tax;
// //   int? minQty;
// //   int? maxQty;
// //   int? interval;
// //   List<Gallery>? galleries;
// //   ProductShop? shop;
// //   Translation? translation;
// //   Unit? unit;
// //
// //   Product({
// //     this.id,
// //     this.uuid,
// //     this.shopId,
// //     this.unitId,
// //     this.keywords,
// //     this.img,
// //     this.qrCode,
// //     this.tax,
// //     this.minQty,
// //     this.maxQty,
// //     this.interval,
// //     this.galleries,
// //     this.shop,
// //     this.translation,
// //     this.unit,
// //   });
// //
// //   factory Product.fromJson(Map<String, dynamic> json) => Product(
// //     id: json["id"],
// //     uuid: json["uuid"],
// //     shopId: json["shop_id"],
// //     unitId: json["unit_id"],
// //     keywords: json["keywords"],
// //     img: json["img"],
// //     qrCode: json["qr_code"],
// //     tax: json["tax"],
// //     minQty: json["min_qty"],
// //     maxQty: json["max_qty"],
// //     interval: json["interval"],
// //     galleries: json["galleries"] == null ? [] : List<Gallery>.from(json["galleries"]!.map((x) => Gallery.fromJson(x))),
// //     shop: json["shop"] == null ? null : ProductShop.fromJson(json["shop"]),
// //     translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
// //     unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "uuid": uuid,
// //     "shop_id": shopId,
// //     "unit_id": unitId,
// //     "keywords": keywords,
// //     "img": img,
// //     "qr_code": qrCode,
// //     "tax": tax,
// //     "min_qty": minQty,
// //     "max_qty": maxQty,
// //     "interval": interval,
// //     "galleries": galleries == null ? [] : List<dynamic>.from(galleries!.map((x) => x.toJson())),
// //     "shop": shop?.toJson(),
// //     "translation": translation?.toJson(),
// //     "unit": unit?.toJson(),
// //   };
// // }
// //
// // class Gallery {
// //   int? id;
// //   String? title;
// //   String? loadableType;
// //   int? loadableId;
// //   String? type;
// //   String? path;
// //   dynamic mime;
// //   dynamic size;
// //   dynamic preview;
// //
// //   Gallery({
// //     this.id,
// //     this.title,
// //     this.loadableType,
// //     this.loadableId,
// //     this.type,
// //     this.path,
// //     this.mime,
// //     this.size,
// //     this.preview,
// //   });
// //
// //   factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
// //     id: json["id"],
// //     title: json["title"],
// //     loadableType: json["loadable_type"],
// //     loadableId: json["loadable_id"],
// //     type: json["type"],
// //     path: json["path"],
// //     mime: json["mime"],
// //     size: json["size"],
// //     preview: json["preview"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "title": title,
// //     "loadable_type": loadableType,
// //     "loadable_id": loadableId,
// //     "type": type,
// //     "path": path,
// //     "mime": mime,
// //     "size": size,
// //     "preview": preview,
// //   };
// // }
// //
// // class ProductShop {
// //   int? id;
// //
// //   ProductShop({
// //     this.id,
// //   });
// //
// //   factory ProductShop.fromJson(Map<String, dynamic> json) => ProductShop(
// //     id: json["id"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //   };
// // }
// //
// // class Translation {
// //   int? id;
// //   int? productId;
// //   String? locale;
// //   String? title;
// //   int? unitId;
// //   int? extraGroupId;
// //
// //   Translation({
// //     this.id,
// //     this.productId,
// //     this.locale,
// //     this.title,
// //     this.unitId,
// //     this.extraGroupId,
// //   });
// //
// //   factory Translation.fromJson(Map<String, dynamic> json) => Translation(
// //     id: json["id"],
// //     productId: json["product_id"],
// //     locale: json["locale"],
// //     title: json["title"],
// //     unitId: json["unit_id"],
// //     extraGroupId: json["extra_group_id"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "product_id": productId,
// //     "locale": locale,
// //     "title": title,
// //     "unit_id": unitId,
// //     "extra_group_id": extraGroupId,
// //   };
// // }
// //
// // class Unit {
// //   int? id;
// //   int? active;
// //   String? position;
// //   DateTime? createdAt;
// //   DateTime? updatedAt;
// //   Translation? translation;
// //
// //   Unit({
// //     this.id,
// //     this.active,
// //     this.position,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.translation,
// //   });
// //
// //   factory Unit.fromJson(Map<String, dynamic> json) => Unit(
// //     id: json["id"],
// //     active: json["active"],
// //     position: json["position"],
// //     createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
// //     updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
// //     translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "active": active,
// //     "position": position,
// //     "created_at": createdAt?.toIso8601String(),
// //     "updated_at": updatedAt?.toIso8601String(),
// //     "translation": translation?.toJson(),
// //   };
// // }
// //
// // class StockExtra {
// //   int? id;
// //   int? stockId;
// //   int? extraGroupId;
// //   int? extraValueId;
// //   Value? value;
// //   Group? group;
// //
// //   StockExtra({
// //     this.id,
// //     this.stockId,
// //     this.extraGroupId,
// //     this.extraValueId,
// //     this.value,
// //     this.group,
// //   });
// //
// //   factory StockExtra.fromJson(Map<String, dynamic> json) => StockExtra(
// //     id: json["id"],
// //     stockId: json["stock_id"],
// //     extraGroupId: json["extra_group_id"],
// //     extraValueId: json["extra_value_id"],
// //     value: json["value"] == null ? null : Value.fromJson(json["value"]),
// //     group: json["group"] == null ? null : Group.fromJson(json["group"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "stock_id": stockId,
// //     "extra_group_id": extraGroupId,
// //     "extra_value_id": extraValueId,
// //     "value": value?.toJson(),
// //     "group": group?.toJson(),
// //   };
// // }
// //
// // class Group {
// //   int? id;
// //   String? type;
// //   int? active;
// //   dynamic shopId;
// //   Translation? translation;
// //
// //   Group({
// //     this.id,
// //     this.type,
// //     this.active,
// //     this.shopId,
// //     this.translation,
// //   });
// //
// //   factory Group.fromJson(Map<String, dynamic> json) => Group(
// //     id: json["id"],
// //     type: json["type"],
// //     active: json["active"],
// //     shopId: json["shop_id"],
// //     translation: json["translation"] == null ? null : Translation.fromJson(json["translation"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "type": type,
// //     "active": active,
// //     "shop_id": shopId,
// //     "translation": translation?.toJson(),
// //   };
// // }
// //
// // class Value {
// //   int? id;
// //   int? extraGroupId;
// //   String? value;
// //   int? active;
// //
// //   Value({
// //     this.id,
// //     this.extraGroupId,
// //     this.value,
// //     this.active,
// //   });
// //
// //   factory Value.fromJson(Map<String, dynamic> json) => Value(
// //     id: json["id"],
// //     extraGroupId: json["extra_group_id"],
// //     value: json["value"],
// //     active: json["active"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "id": id,
// //     "extra_group_id": extraGroupId,
// //     "value": value,
// //     "active": active,
// //   };
// // }
// //
//
//
//
//
//
//
//
