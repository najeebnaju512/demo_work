class SampleModel {
  final String lastname;
  final String firstname;


  SampleModel({
    required this.lastname,
    required this.firstname,

  });


  String toString(){
    return "$firstname";
  }
}
