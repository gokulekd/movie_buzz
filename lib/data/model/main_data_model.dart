import 'dart:convert';

MainDataModel mainDataModelFromJson(String str) =>
    MainDataModel.fromJson(json.decode(str));

String mainDataModelToJson(MainDataModel data) => json.encode(data.toJson());

class MainDataModel {
  bool success;
  Data data;

  MainDataModel({required this.success, required this.data});

  factory MainDataModel.fromJson(Map<String, dynamic> json) => MainDataModel(
    success: json["success"] ?? false,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {"success": success, "data": data.toJson()};
}

class Data {
  List<Banner> banners;
  List<Menu> menus;
  List<SectionTitle> sectionTitles;
  Section section1;
  Section section2;
  Section section3;
  Section section4;
  List<Section5> section5;
  List<Category> category;
  dynamic notifcationCount;
  bool kycVerified;

  Data({
    required this.banners,
    required this.menus,
    required this.sectionTitles,
    required this.section1,
    required this.section2,
    required this.section3,
    required this.section4,
    required this.section5,
    required this.category,
    this.notifcationCount,
    required this.kycVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    // Check if fields exist and are not null before mapping
    banners:
        json["banners"] != null
            ? List<Banner>.from(
              (json["banners"] as List).map((x) => Banner.fromJson(x)),
            )
            : [],
    menus:
        json["menus"] != null
            ? List<Menu>.from(
              (json["menus"] as List).map((x) => Menu.fromJson(x)),
            )
            : [],
    sectionTitles:
        json["sectionTitles"] != null
            ? List<SectionTitle>.from(
              (json["sectionTitles"] as List).map(
                (x) => SectionTitle.fromJson(x),
              ),
            )
            : [],
    section1:
        json["section1"] != null
            ? Section.fromJson(json["section1"])
            : Section(title: "", data: []), // Provide default values
    section2:
        json["section2"] != null
            ? Section.fromJson(json["section2"])
            : Section(title: "", data: []), // Provide default values
    section3:
        json["section3"] != null
            ? Section.fromJson(json["section3"])
            : Section(title: "", data: []), // Provide default values
    section4:
        json["section4"] != null
            ? Section.fromJson(json["section4"])
            : Section(title: "", data: []), // Provide default values
    section5:
        json["section5"] != null
            ? List<Section5>.from(
              (json["section5"] as List).map((x) => Section5.fromJson(x)),
            )
            : [],
    category:
        json["category"] != null
            ? List<Category>.from(
              (json["category"] as List).map((x) => Category.fromJson(x)),
            )
            : [],
    notifcationCount: json["notifcationCount"] ?? "",
    kycVerified: json["kycVerified"] ?? false,
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "menus": List<dynamic>.from(menus.map((x) => x.toJson())),
    "sectionTitles": List<dynamic>.from(sectionTitles.map((x) => x.toJson())),
    "section1": section1.toJson(),
    "section2": section2.toJson(),
    "section3": section3.toJson(),
    "section4": section4.toJson(),
    "section5": List<dynamic>.from(section5.map((x) => x.toJson())),
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "notifcationCount": notifcationCount,
    "kycVerified": kycVerified,
  };
}

class Banner {
  String id;
  String image;
  String imageField;
  String type;
  bool isEnabled;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String link;
  int rank;

  Banner({
    required this.id,
    required this.image,
    required this.imageField,
    required this.type,
    required this.isEnabled,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.link,
    required this.rank,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["_id"] ?? "",
    image: json["image"] ?? "",
    imageField: json["imageField"] ?? "",
    type: json["type"] ?? "",
    isEnabled: json["isEnabled"] ?? false,
    startDate: json["startDate"] ?? "",
    startTime: json["startTime"] ?? "",
    endDate: json["endDate"] ?? "",
    endTime: json["endTime"] ?? "",
    status: json["status"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
    v: json["__v"] ?? 0,
    link: json["link"] ?? "",
    rank: json["rank"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "imageField": imageField,
    "type": type,
    "isEnabled": isEnabled,
    "startDate": startDate,
    "startTime": startTime,
    "endDate": endDate,
    "endTime": endTime,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "link": link,
    "rank": rank,
  };
}

class Category {
  String id;
  String name;
  String industry;
  List<dynamic> subCategories;
  bool isEnabled;
  bool isDisplayHome;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? updatedBy;
  String field;
  int rank;
  String? category;

  Category({
    required this.id,
    required this.name,
    required this.industry,
    required this.subCategories,
    required this.isEnabled,
    required this.isDisplayHome,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.updatedBy,
    required this.field,
    required this.rank,
    this.category,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    industry: json["industry"] ?? "",
    subCategories:
        json["subCategories"] != null
            ? List<dynamic>.from(json["subCategories"].map((x) => x))
            : [],
    isEnabled: json["isEnabled"] ?? false,
    isDisplayHome: json["isDisplayHome"] ?? false,
    status: json["status"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
    v: json["__v"] ?? 0,
    updatedBy: json["updatedBy"],
    field: json["field"] ?? "",
    rank: json["rank"] ?? 0,
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "industry": industry,
    "subCategories": List<dynamic>.from(subCategories.map((x) => x)),
    "isEnabled": isEnabled,
    "isDisplayHome": isDisplayHome,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "updatedBy": updatedBy,
    "field": field,
    "rank": rank,
    "category": category,
  };
}

class Menu {
  String id;
  String image;
  String imageField;
  String title;
  bool isEnabled;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int rank;

  Menu({
    required this.id,
    required this.image,
    required this.imageField,
    required this.title,
    required this.isEnabled,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.rank,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["_id"] ?? "",
    image: json["image"] ?? "",
    imageField: json["imageField"] ?? "",
    title: json["title"] ?? "",
    isEnabled: json["isEnabled"] ?? false,
    status: json["status"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
    v: json["__v"] ?? 0,
    rank: json["rank"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "imageField": imageField,
    "title": title,
    "isEnabled": isEnabled,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "rank": rank,
  };
}

class Section {
  String title;
  List<Datum> data;

  Section({required this.title, required this.data});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    title: json["title"] ?? "",
    data:
        json["data"] != null
            ? List<Datum>.from(
              (json["data"] as List).map((x) => Datum.fromJson(x)),
            )
            : [],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String? image;
  String? imageField;
  String? title;
  String? subTitle;
  String? description;
  bool? isEnabled;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? page;
  String? link;
  int? rank;
  String? media;
  String? mediaField;
  String? mediaType;
  String? name;

  Datum({
    required this.id,
    this.image,
    this.imageField,
    this.title,
    this.subTitle,
    this.description,
    this.isEnabled,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.page,
    this.link,
    this.rank,
    this.media,
    this.mediaField,
    this.mediaType,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] ?? "",
    image: json["image"],
    imageField: json["imageField"],
    title: json["title"],
    subTitle: json["subTitle"],
    description: json["description"],
    isEnabled: json["isEnabled"],
    startDate: json["startDate"],
    startTime: json["startTime"],
    endDate: json["endDate"],
    endTime: json["endTime"],
    status: json["status"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
    v: json["__v"] ?? 0,
    page: json["page"],
    link: json["link"],
    rank: json["rank"],
    media: json["media"],
    mediaField: json["mediaField"],
    mediaType: json["media_type"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "imageField": imageField,
    "title": title,
    "subTitle": subTitle,
    "description": description,
    "isEnabled": isEnabled,
    "startDate": startDate,
    "startTime": startTime,
    "endDate": endDate,
    "endTime": endTime,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "page": page,
    "link": link,
    "rank": rank,
    "media": media,
    "mediaField": mediaField,
    "media_type": mediaType,
    "name": name,
  };
}

class Section5 {
  String id;
  String image;
  String imageField;
  String name;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  bool isEnabled;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String? page;
  int rank;
  String? link;

  Section5({
    required this.id,
    required this.image,
    required this.imageField,
    required this.name,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.isEnabled,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.page,
    required this.rank,
    this.link,
  });

  factory Section5.fromJson(Map<String, dynamic> json) => Section5(
    id: json["_id"] ?? "",
    image: json["image"] ?? "",
    imageField: json["imageField"] ?? "",
    name: json["name"] ?? "",
    startDate: json["startDate"] ?? "",
    startTime: json["startTime"] ?? "",
    endDate: json["endDate"] ?? "",
    endTime: json["endTime"] ?? "",
    isEnabled: json["isEnabled"] ?? false,
    status: json["status"] ?? "",
    createdAt:
        json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
    updatedAt:
        json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"])
            : DateTime.now(),
    v: json["__v"] ?? 0,
    page: json["page"],
    rank: json["rank"] ?? 0,
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "imageField": imageField,
    "name": name,
    "startDate": startDate,
    "startTime": startTime,
    "endDate": endDate,
    "endTime": endTime,
    "isEnabled": isEnabled,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "page": page,
    "rank": rank,
    "link": link,
  };
}

class SectionTitle {
  String id;
  String section1Name;
  String section2Name;
  String section3Name;
  String section4Name;
  String section5Name;
  int v;

  SectionTitle({
    required this.id,
    required this.section1Name,
    required this.section2Name,
    required this.section3Name,
    required this.section4Name,
    required this.section5Name,
    required this.v,
  });

  factory SectionTitle.fromJson(Map<String, dynamic> json) => SectionTitle(
    id: json["_id"] ?? "",
    section1Name: json["section1Name"] ?? "",
    section2Name: json["section2Name"] ?? "",
    section3Name: json["section3Name"] ?? "",
    section4Name: json["section4Name"] ?? "",
    section5Name: json["section5Name"] ?? "",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "section1Name": section1Name,
    "section2Name": section2Name,
    "section3Name": section3Name,
    "section4Name": section4Name,
    "section5Name": section5Name,
    "__v": v,
  };
}
