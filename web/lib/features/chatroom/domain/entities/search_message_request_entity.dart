/// user_id : 2
/// search_query : "hello"

class SearchMessageRequestEntity {
  SearchMessageRequestEntity({
    num? userId,
    String? searchQuery,
  }) {
    _userId = userId;
    _searchQuery = searchQuery;
  }

  SearchMessageRequestEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _searchQuery = json['search_query'];
  }

  num? _userId;
  String? _searchQuery;

  SearchMessageRequestEntity copyWith({
    num? userId,
    String? searchQuery,
  }) =>
      SearchMessageRequestEntity(
        userId: userId ?? _userId,
        searchQuery: searchQuery ?? _searchQuery,
      );

  num? get userId => _userId;

  String? get searchQuery => _searchQuery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['search_query'] = _searchQuery;
    return map;
  }
}
