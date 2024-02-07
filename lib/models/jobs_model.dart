// This is a model class that represents a job.
// ignore_for_file: non_constant_identifier_names

class JobsModel {
  // The id of the job.
  int? id;

  // The name of the job.
  String? name;

  // The image of the job.
  String? image;

  // The type of job (full-time, part-time, etc.).
  String? job_time_type;

  // The type of job (software engineer, accountant, etc.).
  String? job_type;

  // The level of the job (entry-level, mid-level, senior, etc.).
  String? job_level;

  // The description of the job.
  String? job_description;

  // The skills required for the job.
  String? job_skill;

  // The name of the company that is posting the job.
  String? comp_name;

  // The email of the company that is posting the job.
  String? comp_email;

  // The website of the company that is posting the job.
  String? comp_website;

  // The about of the company that is posting the job.
  String? about_comp;

  // The location of the job.
  String? location;

  // The salary of the job.
  String? salary;

  // The number of favorites the job has.
  int? favorites;

  // The number of expired the job has.
  int? expired;

  // The created_at of the job.
  String? created_at;

  // The updated_at of the job.
  String? updated_at;

  // This is a constructor for the JobsModel class.
  // It takes in all of the properties of the class as parameters.
  JobsModel({
    this.id,
    this.name,
    this.image,
    this.job_time_type,
    this.job_type,
    this.job_level,
    this.job_description,
    this.job_skill,
    this.comp_name,
    this.comp_email,
    this.comp_website,
    this.about_comp,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.created_at,
    this.updated_at,
  });

  // This is a factory constructor for the JobsModel class.
  // It takes in a Map<String, dynamic> as a parameter.
  // This map is a representation of a JSON object that contains the properties of the JobsModel class.
  factory JobsModel.fromJson(Map<String, dynamic> json) {
    // This is a function that takes in a Map<String, dynamic> and returns a JobsModel object.
    // It uses the jsonMap to create a new JobsModel object.
    return JobsModel(
      // The id property is set to the value of the 'id' key in the jsonMap.
      id: json['id'],
      // The name property is set to the value of the 'name' key in the jsonMap.
      name: json['name'],
      // The image property is set to the value of the 'image' key in the jsonMap.
      image: json['image'],
      // The job_time_type property is set to the value of the 'job_time_type' key in the jsonMap.
      job_time_type: json['job_time_type'],
      // The job_type property is set to the value of the 'job_type' key in the jsonMap.
      job_type: json['job_type'],
      // The job_level property is set to the value of the 'job_level' key in the jsonMap.
      job_level: json['job_level'],
      // The job_description property is set to the value of the 'job_description' key in the jsonMap.
      job_description: json['job_description'],
      // The job_skill property is set to the value of the 'job_skill' key in the jsonMap.
      job_skill: json['job_skill'],
      // The comp_name property is set to the value of the 'comp_name' key in the jsonMap.
      comp_name: json['comp_name'],
      // The comp_email property is set to the value of the 'comp_email' key in the jsonMap.
      comp_email: json['comp_email'],
      // The comp_website property is set to the value of the 'comp_website' key in the jsonMap.
      comp_website: json['comp_website'],
      // The about_comp property is set to the value of the 'about_comp' key in the jsonMap.
      about_comp: json['about_comp'],
      // The location property is set to the value of the 'location' key in the jsonMap.
      location: json['location'],
      // The salary property is set to the value of the 'salary' key in the jsonMap.
      salary: json['salary'],
      // The favorites property is set to the value of the 'favorites' key in the jsonMap.
      favorites: json['favorites'],
      // The expired property is set to the value of the 'expired' key in the jsonMap.
      expired: json['expired'],
      // The created_at property is set to the value of the 'created_at' key in the jsonMap.
      created_at: json['created_at'],
      // The updated_at property is set to the value of the 'updated_at' key in the jsonMap.
      updated_at: json['updated_at'],
    );
  }

  // This is a function that converts a JobsModel object to a Map<String, dynamic>.
  // It is used to convert the object to a JSON representation.
  Map<String, dynamic> toJson() {
    // This is a function that takes in a JobsModel object and returns a Map<String, dynamic>.
    // It uses the object to create a new Map<String, dynamic>.
    return {
      // The 'id' key is set to the value of the id property.
      'id': id,
      // The 'name' key is set to the value of the name property.
      'name': name,
      // The 'image' key is set to the value of the image property.
      'image': image,
      // The 'job_time_type' key is set to the value of the job_time_type property.
      'job_time_type': job_time_type,
      // The 'job_type' key is set to the value of the job_type property.
      'job_type': job_type,
      // The 'job_level' key is set to the value of the job_level property.
      'job_level': job_level,
      // The 'job_description' key is set to the value of the job_description property.
      'job_description': job_description,
      // The 'job_skill' key is set to the value of the job_skill property.
      'job_skill': job_skill,
      // The 'comp_name' key is set to the value of the comp_name property.
      'comp_name': comp_name,
      // The 'comp_email' key is set to the value of the comp_email property.
      'comp_email': comp_email,
      // The 'comp_website' key is set to the value of the comp_website property.
      'comp_website': comp_website,
      // The 'about_comp' key is set to the value of the about_comp property.
      'about_comp': about_comp,
      // The 'location' key is set to the value of the location property.
      'location': location,
      // The 'salary' key is set to the value of the salary property.
      'salary': salary,
      // The 'favorites' key is set to the value of the favorites property.
      'favorites': favorites,
      // The 'expired' key is set to the value of the expired property.
      'expired': expired,
      // The 'created_at' key is set to the value of the created_at property.
      'created_at': created_at,
      // The 'updated_at' key is set to the value of the updated_at property.
      'updated_at': updated_at,
    };
  }
}
