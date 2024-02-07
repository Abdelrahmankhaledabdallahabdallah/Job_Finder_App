// ignore_for_file: non_constant_identifier_names
// This line of code tells the compiler to ignore the warning that the variable names
// are not constant.

class UserPortofolioModel {
  // This class represents a user's portfolio.

  String? cv_file;
  // This field stores the path to the user's CV file.

  String? image;
  // This field stores the path to the user's profile image.

  String? name;
  // This field stores the user's name.

  int? user_id;
  // This field stores the user's unique identifier.

  String? email;
  // This field stores the user's email address.

  UserPortofolioModel({
    this.cv_file,
    this.image,
    this.name,
    this.email,
    this.user_id,
  });
  // This is the constructor for the UserPortofolioModel class. It takes in the values for
  // the fields and assigns them to the corresponding fields.

  factory UserPortofolioModel.fromJson(Map<String, dynamic> json) {
    // This factory constructor is used to create a UserPortofolioModel object from a JSON object.

    return UserPortofolioModel(
      cv_file: json['cv_file'],
      // This line extracts the value of the 'cv_file' key from the JSON object and assigns it to the cv_file field.

      name: json['name'],
      // This line extracts the value of the 'name' key from the JSON object and assigns it to the name field.

      email: json['email'],
      // This line extracts the value of the 'email' key from the JSON object and assigns it to the email field.

      image: json['image'],
      // This line extracts the value of the 'image' key from the JSON object and assigns it to the image field.

      user_id: json['user_id'],
      // This line extracts the value of the 'user_id' key from the JSON object and assigns it to the user_id field.
    );
  }

  Map<String, dynamic> toJson() {
    // This method converts the UserPortofolioModel object to a JSON object.

    return {
      'cv_file': cv_file,
      // This line adds the cv_file field to the JSON object.

      'name': name,
      // This line adds the name field to the JSON object.

      'email': email,
      // This line adds the email field to the JSON object.

      'image': image,
      // This line adds the image field to the JSON object.

      'user_id': user_id,
      // This line adds the user_id field to the JSON object.
    };
  }
}
