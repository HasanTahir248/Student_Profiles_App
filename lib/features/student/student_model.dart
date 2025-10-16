class Student{
  final String name;
  final String age;
  final String course;
  final String description;

  Student(
    {
      required this.name,
      required this.age,
      required this.course,
      required this.description,
    }
 );
// convert JSON to Student object
 factory  Student.fromJson(Map<String, dynamic> json){
  return Student(
    name: json['Name'] ?? 'Unknown Name',
    age: json['Age'] ?? 'Unknown value',
    course: json['Course'] ?? 'Unknown Value',
    description: json['description'] ?? 'unknown Value',
  );
 }

 // convert Student object to JSON (just for understanding)
  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'Age': age,
      'Course': course,
      'description': description,
    };
  }
}