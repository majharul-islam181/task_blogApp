
class bloglistModelDataBlogsLinks {


  String? url;
  String? label;
  bool? active;

  bloglistModelDataBlogsLinks({
    this.url,
    this.label,
    this.active,
  });
  bloglistModelDataBlogsLinks.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    active = json['active'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class bloglistModelDataBlogsData {


  int? id;
  int? categoryId;
  String? title;
  String? subTitle;
  String? slug;
  String? description;
  String? image;
  String? video;
  String? date;
  String? status;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  bloglistModelDataBlogsData({
    this.id,
    this.categoryId,
    this.title,
    this.subTitle,
    this.slug,
    this.description,
    this.image,
    this.video,
    this.date,
    this.status,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });
  bloglistModelDataBlogsData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    categoryId = json['category_id']?.toInt();
    title = json['title']?.toString();
    subTitle = json['sub_title']?.toString();
    slug = json['slug']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    video = json['video']?.toString();
    date = json['date']?.toString();
    status = json['status']?.toString();
    createdBy = json['created_by']?.toInt();
    updatedBy = json['updated_by']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['sub_title'] = subTitle;
    data['slug'] = slug;
    data['description'] = description;
    data['image'] = image;
    data['video'] = video;
    data['date'] = date;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class bloglistModelDataBlogs {


  int? currentPage;
  List<bloglistModelDataBlogsData?>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<bloglistModelDataBlogsLinks?>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  bloglistModelDataBlogs({
    this.currentPage,
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
    this.total,
  });
  bloglistModelDataBlogs.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page']?.toInt();
  if (json['data'] != null) {
  final v = json['data'];
  final arr0 = <bloglistModelDataBlogsData>[];
  v.forEach((v) {
  arr0.add(bloglistModelDataBlogsData.fromJson(v));
  });
    data = arr0;
    }
    firstPageUrl = json['first_page_url']?.toString();
    from = json['from']?.toInt();
    lastPage = json['last_page']?.toInt();
    lastPageUrl = json['last_page_url']?.toString();
  if (json['links'] != null) {
  final v = json['links'];
  final arr0 = <bloglistModelDataBlogsLinks>[];
  v.forEach((v) {
  arr0.add(bloglistModelDataBlogsLinks.fromJson(v));
  });
    links = arr0;
    }
    nextPageUrl = json['next_page_url']?.toString();
    path = json['path']?.toString();
    perPage = json['per_page']?.toInt();
    prevPageUrl = json['prev_page_url']?.toString();
    to = json['to']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['data'] = arr0;
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      final v = links;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['links'] = arr0;
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class bloglistModelData {

  bloglistModelDataBlogs? blogs;

  bloglistModelData({
    this.blogs,
  });
  bloglistModelData.fromJson(Map<String, dynamic> json) {
    blogs = (json['blogs'] != null) ? bloglistModelDataBlogs.fromJson(json['blogs']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (blogs != null) {
      data['blogs'] = blogs!.toJson();
    }
    return data;
  }
}

class bloglistModel {


  bloglistModelData? data;
  String? message;
  int? status;

  bloglistModel({
    this.data,
    this.message,
    this.status,
  });
  bloglistModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? bloglistModelData.fromJson(json['data']) : null;
    message = json['message']?.toString();
    status = json['status']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = this.data!.toJson();
      data['message'] = message;
    data['status'] = status;
    return data;
  }
}
