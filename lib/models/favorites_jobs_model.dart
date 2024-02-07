// ignore any linting for non constant identifier names
// ignore_for_file: non_constant_identifier_names

// This class represents a model for a favorite job.
class FavoritesJobsModel {

  // The id of the favorite job.
  int? id;

  // The user id of the user who favourited the job.
  int? user_id;

  // Whether the user has liked the job.
  int? like;

  // The image associated with the job.
  String? image;

  // The name of the job.
  String? name;

  // The location of the job.
  String? location;

  // The id of the job.
  int? job_id;

  // The name of the job.
  String? job_name;

  // The image associated with the job.
  String? job_image;

  // The time type of the job.
  String? job_time_type;

  // The type of the job.
  String? job_type;

  // The level of the job.
  String? job_level;

  // The description of the job.
  String? job_description;

  // The skills required for the job.
  String? job_skill;

  // The name of the company that posted the job.
  String? comp_name;

  // The email of the company that posted the job.
  String? comp_email;

  // The website of the company that posted the job.
  String? comp_website;

  // The about of the company that posted the job.
  String? about_comp;

  // The location of the job.
  String? job_location;

  // The salary of the job.
  String? salary;

  // Whether the job is a favourite.
  int? favorites;

  // Whether the job has expired.
  int? expired;

  // The date the job was created.
  String? created_at;

  // The date the job was updated.
  String? updated_at;

  // Constructor for the FavoritesJobsModel class.
  FavoritesJobsModel({
    this.id,
    this.name,
    this.image,
    this.user_id,
    this.like,
    this.location,
    this.job_id,
    this.job_name,
    this.job_image,
    this.job_time_type,
    this.job_type,
    this.job_level,
    this.job_description,
    this.job_skill,
    this.comp_name,
    this.comp_email,
    this.comp_website,
    this.about_comp,
    this.job_location,
    this.salary,
    this.favorites,
    this.expired,
    this.created_at,
    this.updated_at,
  });

  // Factory constructor to convert a JSON map to a FavoritesJobsModel object.
  factory FavoritesJobsModel.fromJson(Map<String, dynamic> json) {
    return FavoritesJobsModel(
      id: json['id'], // The id of the favorite job.
      name: json['name'], // The name of the job.
      image: json['image'], // The image associated with the job.
      user_id: json['user_id'], // The user id of the user who favourited the job.
      like: json['like'], // Whether the user has liked the job.
      location: json['jobs']['location'], // The location of the job.
      job_id: json['jobs']['id'], // The id of the job.
      job_name: json['jobs']['name'], // The name of the job.
      job_image: json['jobs']['image'], // The image associated with the job.
      job_time_type: json['jobs']['job_time_type'], // The time type of the job.
      job_type: json['jobs']['job_type'], // The type of the job.
      job_level: json['jobs']['job_level'], // The level of the job.
      job_description: json['jobs']['job_description'], // The description of the job.
      job_skill: json['jobs']['job_skill'], // The skills required for the job.
      comp_name: json['jobs']['comp_name'], // The name of the company that posted the job.
      comp_email: json['jobs']['comp_email'], // The email of the company that posted the job.
      comp_website: json['jobs']['comp_website'], // The website of the company that posted the job.
      about_comp: json['jobs']['about_comp'], // The about of the company that posted the job.
      job_location: json['jobs']['location'], // The location of the job.
      salary: json['jobs']['salary'], // The salary of the job.
      favorites: json['jobs']['favorites'], // Whether the job is a favourite.
      expired: json['jobs']['expired'], // Whether the job has expired.
      created_at: json['jobs']['created_at'], // The date the job was created.
      updated_at: json['jobs']['updated_at'], // The date the job was updated.
    );
  }

  // // Method to convert a FavoritesJobsModel object to a JSON map.
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id, // The id of the favorite job.
  //     'name': name, // The name of the job.
  //     'image': image, // The image associated with the job.
  //     'like': like, // Whether the user has liked the job.
  //     'user_id': user_id, // The user id of the user who favourited the job.
  //     'location': location, // The location of the job.
  //     'id': job_id, // The id of the job.
  //     'name': job_name, // The name of the job.
  //     'image': job_image, // The image associated with the job.
  //     'job_time_type': job_time_type, // The time type of the job.
  //     'job_type': job_type, // The type of the job.
  //     'job_level': job_level, // The level of the job.
  //     'job_description': job_description, // The description of the job.
  //     'job_skill': job_skill, // The skills required for the job.
  //     'comp_name': comp_name, // The name of the company that posted the job.
  //     'comp_email': comp_email, // The email of the company that posted the job.
  //     'comp_website': comp_website, // The website of the company that posted the job.
  //     'about_comp': about_comp, // The about of the company that posted the job.
  //     'location': job_location, // The location of the job.
  //     'salary': salary, // The salary of the job.
  //     'favorites': favorites, // Whether the job is a favourite.
  //     'expired': expired, // Whether the job has expired.
  //     'created_at': created_at, // The date the job was created.
  //     'updated_at': updated_at, // The date the job was updated.
  //   };
  // }
}