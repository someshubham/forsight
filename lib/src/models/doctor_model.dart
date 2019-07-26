
class DoctorModel {
  String id;
  String registrationId;
  String accessToken;
  String name;
  String dateOfBirth;
  String fatherName;
  String gender;
  String emailAddress;
  String mobileNumber;
  String aadhaarNumber;
  String resAddress1;
  String resAddress2;
  String resCity;
  String resState;
  String residentialCountry;
  String resPincode;
  String couAddress1;
  String couAddress2;
  String couCity;
  String couState;
  String courierCountry;
  String couPincode;
  String optometryQualificationDiploma;
  String optometryQualificationDegree;
  String optometryQualificationOthers;
  String collegeName;
  String universityName;
  String otherInstitution;
  String yearOfPassingDiploma;
  String duration;
  String memberOfOptometry;
  String associationName;
  String membershipNumber;
  String completedMaster;
  String masterUniversityName;
  String studyCenterName;
  String yearOfPassingMaster;
  String completedPhd;
  String yearOfPassingPhd;
  String currentlyWorking;
  String photo;
  String currentProfStatus;
  String currentDesignation;
  String nameOfOrganisation;
  String orgAddress1;
  String orgAddress2;
  String orgCity;
  String orgState;
  String countryOfOrganisation;
  String orgPincode;
  String howYouKnow;

  DoctorModel(
      {this.id,
      this.registrationId,
      this.accessToken,
      this.name,
      this.dateOfBirth,
      this.fatherName,
      this.gender,
      this.emailAddress,
      this.mobileNumber,
      this.aadhaarNumber,
      this.resAddress1,
      this.resAddress2,
      this.resCity,
      this.resState,
      this.residentialCountry,
      this.resPincode,
      this.couAddress1,
      this.couAddress2,
      this.couCity,
      this.couState,
      this.courierCountry,
      this.couPincode,
      this.optometryQualificationDiploma,
      this.optometryQualificationDegree,
      this.optometryQualificationOthers,
      this.collegeName,
      this.universityName,
      this.otherInstitution,
      this.yearOfPassingDiploma,
      this.duration,
      this.memberOfOptometry,
      this.associationName,
      this.membershipNumber,
      this.completedMaster,
      this.masterUniversityName,
      this.studyCenterName,
      this.yearOfPassingMaster,
      this.completedPhd,
      this.yearOfPassingPhd,
      this.currentlyWorking,
      this.photo,
      this.currentProfStatus,
      this.currentDesignation,
      this.nameOfOrganisation,
      this.orgAddress1,
      this.orgAddress2,
      this.orgCity,
      this.orgState,
      this.countryOfOrganisation,
      this.orgPincode,
      this.howYouKnow});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    registrationId = json['registration_id'];
    accessToken = json['accessToken'];
    name = json['name'];
    dateOfBirth = json['date_of_birth'];
    fatherName = json['father_name'];
    gender = json['gender'];
    emailAddress = json['email_address'];
    mobileNumber = json['mobile_number'];
    aadhaarNumber = json['aadhaar_number'];
    resAddress1 = json['res_address1'];
    resAddress2 = json['res_address2'];
    resCity = json['res_city'];
    resState = json['res_state'];
    residentialCountry = json['residential_country'];
    resPincode = json['res_pincode'];
    couAddress1 = json['cou_address1'];
    couAddress2 = json['cou_address2'];
    couCity = json['cou_city'];
    couState = json['cou_state'];
    courierCountry = json['courier_country'];
    couPincode = json['cou_pincode'];
    optometryQualificationDiploma = json['optometry_qualification_diploma'];
    optometryQualificationDegree = json['optometry_qualification_degree'];
    optometryQualificationOthers = json['optometry_qualification_others'];
    collegeName = json['college_name'];
    universityName = json['university_name'];
    otherInstitution = json['other_institution'];
    yearOfPassingDiploma = json['year_of_passing_diploma'];
    duration = json['duration'];
    memberOfOptometry = json['member_of_optometry'];
    associationName = json['association_name'];
    membershipNumber = json['membership_number'];
    completedMaster = json['completed_master'];
    masterUniversityName = json['master_university_name'];
    studyCenterName = json['study_center_name'];
    yearOfPassingMaster = json['year_of_passing_master'];
    completedPhd = json['completed_phd'];
    yearOfPassingPhd = json['year_of_passing_phd'];
    currentlyWorking = json['currently_working'];
    photo = json['photo'];
    currentProfStatus = json['current_prof_status'];
    currentDesignation = json['current_designation'];
    nameOfOrganisation = json['name_of_organisation'];
    orgAddress1 = json['org_address1'];
    orgAddress2 = json['org_address2'];
    orgCity = json['org_city'];
    orgState = json['org_state'];
    countryOfOrganisation = json['country_of_organisation'];
    orgPincode = json['org_pincode'];
    howYouKnow = json['how_you_know'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['registration_id'] = this.registrationId;
    data['accessToken'] = this.accessToken;
    data['name'] = this.name;
    data['date_of_birth'] = this.dateOfBirth;
    data['father_name'] = this.fatherName;
    data['gender'] = this.gender;
    data['email_address'] = this.emailAddress;
    data['mobile_number'] = this.mobileNumber;
    data['aadhaar_number'] = this.aadhaarNumber;
    data['res_address1'] = this.resAddress1;
    data['res_address2'] = this.resAddress2;
    data['res_city'] = this.resCity;
    data['res_state'] = this.resState;
    data['residential_country'] = this.residentialCountry;
    data['res_pincode'] = this.resPincode;
    data['cou_address1'] = this.couAddress1;
    data['cou_address2'] = this.couAddress2;
    data['cou_city'] = this.couCity;
    data['cou_state'] = this.couState;
    data['courier_country'] = this.courierCountry;
    data['cou_pincode'] = this.couPincode;
    data['optometry_qualification_diploma'] =
        this.optometryQualificationDiploma;
    data['optometry_qualification_degree'] = this.optometryQualificationDegree;
    data['optometry_qualification_others'] = this.optometryQualificationOthers;
    data['college_name'] = this.collegeName;
    data['university_name'] = this.universityName;
    data['other_institution'] = this.otherInstitution;
    data['year_of_passing_diploma'] = this.yearOfPassingDiploma;
    data['duration'] = this.duration;
    data['member_of_optometry'] = this.memberOfOptometry;
    data['association_name'] = this.associationName;
    data['membership_number'] = this.membershipNumber;
    data['completed_master'] = this.completedMaster;
    data['master_university_name'] = this.masterUniversityName;
    data['study_center_name'] = this.studyCenterName;
    data['year_of_passing_master'] = this.yearOfPassingMaster;
    data['completed_phd'] = this.completedPhd;
    data['year_of_passing_phd'] = this.yearOfPassingPhd;
    data['currently_working'] = this.currentlyWorking;
    data['photo'] = this.photo;
    data['current_prof_status'] = this.currentProfStatus;
    data['current_designation'] = this.currentDesignation;
    data['name_of_organisation'] = this.nameOfOrganisation;
    data['org_address1'] = this.orgAddress1;
    data['org_address2'] = this.orgAddress2;
    data['org_city'] = this.orgCity;
    data['org_state'] = this.orgState;
    data['country_of_organisation'] = this.countryOfOrganisation;
    data['org_pincode'] = this.orgPincode;
    data['how_you_know'] = this.howYouKnow;
    return data;
  }
}