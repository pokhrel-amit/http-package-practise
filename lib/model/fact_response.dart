

class FactResponse {
  int id;
  String category;
  List<Facts> facts;

  FactResponse({
    required this.id,
    required this.category,
    required this.facts,
  });

  FactResponse.fromJson(Map<String,dynamic> json):  id = json['id'],
    category = json['category'],
     facts = <Facts>[]
     {
    for (var item in json['facts']) {
      facts.add(Facts.fromJson(item));
    }
    print(facts);
  }
}

class Facts {
  int id;
  String title;
  String description;
  String imageUrl;
  Facts({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  Facts.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        imageUrl = json['image_url'] {}
  
  // @override
  // String toString() => '''
  // id: $id,
  // title: $title,
  // description: $description,

  // ''';
}
