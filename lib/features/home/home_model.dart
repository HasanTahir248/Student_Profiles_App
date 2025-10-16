class Home{
  final String title;
  final String description;
  final String ending;

  Home(
    {
      required this.title,
      required this.description,
      required this.ending
    }
  );

  factory Home.fromJson(Map<String, dynamic> json){
    return Home(
      title: json['title'] ?? 'Unknow title',
      description: json['description'] ?? 'No Description',
      ending: json['ending'] ?? 'Default version!! Will be updating soon!',
    ); 
  }
}

