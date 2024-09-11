class GetAllJobModel {
  String? message;
  Data? data;
  bool? success;

  GetAllJobModel({this.message, this.data, this.success});

  GetAllJobModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<Jobs>? jobs;
  int? totalJobs;

  Data({this.jobs, this.totalJobs});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
    totalJobs = json['total_jobs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    data['total_jobs'] = this.totalJobs;
    return data;
  }
}

class Jobs {
  int? id;
  String? title;
  String? description;
  String? jobStartDate;
  int? duration;
  int? salary;
  int? salaryTime;
  int? recruiterId;
  String? publicationDate;
  int? location;

  Jobs(
      {this.id,
        this.title,
        this.description,
        this.jobStartDate,
        this.duration,
        this.salary,
        this.salaryTime,
        this.recruiterId,
        this.publicationDate,
        this.location});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    jobStartDate = json['job_start_date'];
    duration = json['duration'];
    salary = json['salary'];
    salaryTime = json['salary_time'];
    recruiterId = json['recruiter_id'];
    publicationDate = json['publication_date'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['job_start_date'] = this.jobStartDate;
    data['duration'] = this.duration;
    data['salary'] = this.salary;
    data['salary_time'] = this.salaryTime;
    data['recruiter_id'] = this.recruiterId;
    data['publication_date'] = this.publicationDate;
    data['location'] = this.location;
    return data;
  }
}
