class ModelCountryList {
  List<CountryList>? countryList;

  ModelCountryList({this.countryList});

  ModelCountryList.fromJson(Map<String, dynamic> json) {
    if (json['country_list'] != null) {
      countryList = <CountryList>[];
      json['country_list'].forEach((v) {
        countryList!.add(new CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.countryList != null) {
      data['country_list'] = this.countryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryList {
  String? countryCode;
  String? countryName;
  String? countryFlag;

  CountryList({this.countryCode, this.countryName, this.countryFlag});

  CountryList.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    countryName = json['country_name'];
    countryFlag = json['country_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['country_flag'] = this.countryFlag;
    return data;
  }
}
