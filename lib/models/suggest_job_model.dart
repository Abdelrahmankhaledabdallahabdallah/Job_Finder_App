// ignore_for_file: non_constant_identifier_names

class SuggestJobsModel {
  // The id of the job.
  int? id;

  // The name of the job.
  String? name;

  // The image of the job.
  String? image;

  // The job time type.
  String? job_time_type;

  // The job type.
  String? job_type;

  // The job level.
  String? job_level;

  // The job description.
  String? job_description;

  // The job skill.
  String? job_skill;

  // The company name.
  String? comp_name;

  // The company email.
  String? comp_email;

  // The company website.
  String? comp_website;

  // The about company.
  String? about_comp;

  // The location of the job.
  String? location;

  // The salary of the job.
  String? salary;

  // The favorites of the job.
  int? favorites;

  // The expired of the job.
  int? expired;

  // The created at of the job.
  String? created_at;

  // The updated at of the job.
  String? updated_at;

  SuggestJobsModel({
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

  factory SuggestJobsModel.fromJson(Map<String, dynamic> json) {
    return SuggestJobsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      job_time_type: json['job_time_type'],
      job_type: json['job_type'],
      job_level: json['job_level'],
      job_description: json['job_description'],
      job_skill: json['job_skill'],
      comp_name: json['comp_name'],
      comp_email: json['comp_email'],
      comp_website: json['comp_website'],
      about_comp: json['about_comp'],
      location: json['location'],
      salary: json['salary'],
      favorites: json['favorites'],
      expired: json['expired'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
  // Convert the SuggestJobsModel to a Map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'job_time_type': job_time_type,
      'job_type': job_type,
      'job_level': job_level,
      'job_description': job_description,
      'job_skill': job_skill,
      'comp_name': comp_name,
      'comp_email': comp_email,
      'comp_website': comp_website,
      'about_comp': about_comp,
      'location': location,
      'salary': salary,
      'favorites': favorites,
      'expired': expired,
      'created_at': created_at,
      'updated_at': updated_at,
    };
  }
}
