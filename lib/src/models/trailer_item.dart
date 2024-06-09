class TrailerItem {
  int? _id;
  List<Results>? _results;

  TrailerItem({int? id, List<Results>? results}) {
    if (id != null) {
      this._id = id;
    }
    if (results != null) {
      this._results = results;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  List<Results>? get results => _results;
  set results(List<Results>? results) => _results = results;

  TrailerItem.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? _iso6391;
  String? _iso31661;
  String? _name;
  String? _key;
  String? _site;
  int? _size;
  String? _type;
  bool? _official;
  String? _publishedAt;
  String? _id;

  Results(
      {String? iso6391,
        String? iso31661,
        String? name,
        String? key,
        String? site,
        int? size,
        String? type,
        bool? official,
        String? publishedAt,
        String? id}) {
    if (iso6391 != null) {
      this._iso6391 = iso6391;
    }
    if (iso31661 != null) {
      this._iso31661 = iso31661;
    }
    if (name != null) {
      this._name = name;
    }
    if (key != null) {
      this._key = key;
    }
    if (site != null) {
      this._site = site;
    }
    if (size != null) {
      this._size = size;
    }
    if (type != null) {
      this._type = type;
    }
    if (official != null) {
      this._official = official;
    }
    if (publishedAt != null) {
      this._publishedAt = publishedAt;
    }
    if (id != null) {
      this._id = id;
    }
  }

  String? get iso6391 => _iso6391;
  set iso6391(String? iso6391) => _iso6391 = iso6391;
  String? get iso31661 => _iso31661;
  set iso31661(String? iso31661) => _iso31661 = iso31661;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get key => _key;
  set key(String? key) => _key = key;
  String? get site => _site;
  set site(String? site) => _site = site;
  int? get size => _size;
  set size(int? size) => _size = size;
  String? get type => _type;
  set type(String? type) => _type = type;
  bool? get official => _official;
  set official(bool? official) => _official = official;
  String? get publishedAt => _publishedAt;
  set publishedAt(String? publishedAt) => _publishedAt = publishedAt;
  String? get id => _id;
  set id(String? id) => _id = id;

  Results.fromJson(Map<String, dynamic> json) {
    _iso6391 = json['iso_639_1'];
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
    _key = json['key'];
    _site = json['site'];
    _size = json['size'];
    _type = json['type'];
    _official = json['official'];
    _publishedAt = json['published_at'];
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this._iso6391;
    data['iso_3166_1'] = this._iso31661;
    data['name'] = this._name;
    data['key'] = this._key;
    data['site'] = this._site;
    data['size'] = this._size;
    data['type'] = this._type;
    data['official'] = this._official;
    data['published_at'] = this._publishedAt;
    data['id'] = this._id;
    return data;
  }
}
