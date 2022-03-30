class BaseData<T extends BaseObject> {
  List<T>? data;
  String? status;
  BaseData({this.data, this.status});
  BaseData.fromJson(Map<String, dynamic> json, T obj) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(obj.fromJson(v as Map<String, dynamic>) as T);
      });
    }
    status = json['status'] as String;
  }
}

abstract class BaseObject {
  fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
