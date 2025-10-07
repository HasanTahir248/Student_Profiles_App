class Student{
  final String name;
  final int age;
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
    name: json['name'],
    age: json['age'],
    course: json['course'],
    description: json['description'],
  );
 }

 // convert Student object to JSON (just for understanding)
  Map<String, dynamic> toJson(){
    return {
      'name': name,
      'age': age,
      'course': course,
      'description': description,
    };
  }
}