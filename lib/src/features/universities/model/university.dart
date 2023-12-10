class University {
  String? country;
  String? alphaTwoCode;
  String? stateProvince;
  String? name;
  List<String>? webPages;
  List<String>? domains;

  University({
    this.country,
    this.alphaTwoCode,
    this.stateProvince,
    this.name,
    this.webPages,
    this.domains,
  });

  University.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    name = json['name'];
    webPages = json['web_pages'].cast<String>();
    domains = json['domains'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['alpha_two_code'] = alphaTwoCode;
    data['state-province'] = stateProvince;
    data['name'] = name;
    data['web_pages'] = webPages;
    data['domains'] = domains;
    return data;
  }
}
