class User {
  String? key;
  UserData? userData;

  User({this.key, this.userData});
}

class UserDataList {
  List<User>? dataList;

  UserDataList({this.dataList});

  UserDataList.fromMap(Map<dynamic, dynamic> map){
    List<User> list = [];
    map.forEach((key, value) {
      list.add(User(key: key, userData: UserData.fromJson(value)));
    });
    dataList = list;
  }
}

class UserData {
  String? name;
  String? address;

  UserData({this.name, this.address});

  UserData.fromJson(Map<dynamic, dynamic> json){
    name = json["name"];
    address = json["address"];
  }
}


class UserDataListPrev {
  List<UserData>? dataList;

  UserDataListPrev({this.dataList});

  UserDataListPrev.fromMap(Map<dynamic, dynamic> map){
    List<dynamic> list = [];
    map.forEach((key, value) {
      list.add(UserData.fromJson(value));
    });
    dataList = list.cast<UserData>();
  }
}
