import 'package:forsight/src/models/doctor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForsightSharedPrefs {
  static SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String $name = 'name';
  static const String $dob = 'dob';
  static const String $fatherName = 'fatherName';
  static const String $gender = 'gender';
  static const String $email = 'email';
  static const String $mobile = 'mobile';
  static const String $aadhaarNumber = 'aadhaarNumber';
  // These are for location update
  // This is for residential address
  static const String $resAddress1 = 'resAddress1';
  static const String $resAddress2 = 'resAddress2';
  static const String $resCity = 'resCity';
  static const String $resState = 'resState';
  static const String $resCountry = 'resCountry';
  static const String $resPinCode = 'resPinCode';
  // This is for Organisation address
  static const String $nameOfOrganisation = 'nameOfOrganisation';
  static const String $orgAddress1 = 'orgAddress1';
  static const String $orgAddress2 = 'orgAddress2';
  static const String $orgCity = 'orgCity';
  static const String $orgState = 'orgState';
  static const String $orgCountry = 'orgCountry';
  static const String $orgPinCode = 'orgPinCode';
  // This is for education an; qualification
  static const String $qualificationDegree = 'qualificationDegree';
  static const String $qualificationDiploma = 'qualificationDiploma';
  static const String $qualificationOther = 'qualificationOther';
  static const String $collegeName = 'collegeName';
  static const String $universityName = 'universityName';
  static const String $otherInstituteName = 'otherInstituteName';
  static const String $yearOfPassingDiploma = 'yearOfPassingDiploma';
  static const String $completedMaster = 'completedMaster';
  static const String $masterUniversityName = 'masterUniversityName';
  static const String $studyCenterName = 'studyCenterName';
  static const String $yearOfPassingMaster = 'yearOfPassingMaster';
  static const String $completedPhD = 'completedPhD';
  static const String $yearOfPassingPhD = 'yearOfPassingPhD';
  static const String $currentlyWorking = 'currentlyWorking';
  static const String $currentProfStatus = 'currentProfStatus';
  static const String $currentDesignation = 'currentDesignation';

  static set name(value) => prefs.setString($name, value);
  static get name => prefs.getString($name);

  static set dob(value) => prefs.setString($dob, value);
  static get dob => prefs.getString($dob);

  static set fatherName(value) => prefs.setString($fatherName, value);
  static get fatherName => prefs.getString($fatherName);

  static set gender(value) => prefs.setString($gender, value);
  static get gender => prefs.getString($gender);

  static set email(value) => prefs.setString($email, value);
  static get email => prefs.getString($email);

  static set mobile(value) => prefs.setString($mobile, value);
  static get mobile => prefs.getString($mobile);

  static set aadhaarNumber(value) => prefs.setString($aadhaarNumber, value);
  static get aadhaarNumber => prefs.getString($aadhaarNumber);

  static set resAddress1(value) => prefs.setString($resAddress1, value);
  static get resAddress1 => prefs.getString($resAddress1);

  static set resAddress2(value) => prefs.setString($resAddress2, value);
  static get resAddress2 => prefs.getString($resAddress2);

  static set resCity(value) => prefs.setString($resCity, value);
  static get resCity => prefs.getString($resCity);

  static set resState(value) => prefs.setString($resState, value);
  static get resState => prefs.getString($resState);

  static set resCountry(value) => prefs.setString($resCountry, value);
  static get resCountry => prefs.getString($resCountry);

  static set resPinCode(value) => prefs.setString($resPinCode, value);
  static get resPinCode => prefs.getString($resPinCode);

  static set nameOfOrganisation(value) =>
      prefs.setString($nameOfOrganisation, value);
  static get nameOfOrganisation => prefs.getString($nameOfOrganisation);

  static set orgAddress1(value) => prefs.setString($orgAddress1, value);
  static get orgAddress1 => prefs.getString($orgAddress1);

  static set orgAddress2(value) => prefs.setString($orgAddress2, value);
  static get orgAddress2 => prefs.getString($orgAddress2);

  static set orgCity(value) => prefs.setString($orgCity, value);
  static get orgCity => prefs.getString($orgCity);

  static set orgState(value) => prefs.setString($orgState, value);
  static get orgState => prefs.getString($orgState);

  static set orgCountry(value) => prefs.setString($orgCountry, value);
  static get orgCountry => prefs.getString($orgCountry);

  static set orgPinCode(value) => prefs.setString($orgPinCode, value);
  static get orgPinCode => prefs.getString($orgPinCode);

  static get qualificationDegree => prefs.getString($qualificationDegree);
  static get qualificationDiploma => prefs.getString($qualificationDiploma);
  static get qualificationOther => prefs.getString($qualificationOther);
  static get collegeName => prefs.getString($collegeName);
  static get universityName => prefs.getString($universityName);
  static get otherInstituteName => prefs.getString($otherInstituteName);
  static get yearOfPassingDiploma => prefs.getString($yearOfPassingDiploma);
  static get completedMaster => prefs.getString($completedMaster);
  static get masterUniversityName => prefs.getString($masterUniversityName);
  static get studyCenterName => prefs.getString($studyCenterName);
  static get yearOfPassingMaster => prefs.getString($yearOfPassingMaster);
  static get completedPhD => prefs.getString($completedPhD);
  static get yearOfPassingPhD => prefs.getString($yearOfPassingPhD);
  static get currentlyWorking => prefs.getString($currentlyWorking);
  static get currentProfStatus => prefs.getString($currentProfStatus);
  static get currentDesignation => prefs.getString($currentDesignation);

  Future<void> setUserDetails({
    String name,
    String dob,
    String fatherName,
    String gender,
    String email,
    String mobile,
    String aadhaar,
  }) async {
    prefs.setString($name, name);
    prefs.setString($dob, dob);
    prefs.setString($fatherName, fatherName);
    prefs.setString($gender, gender);
    prefs.setString($email, email);
    prefs.setString($mobile, mobile);
    prefs.setString($aadhaarNumber, aadhaar);
  }

  Future<void> setLocationDetails({
    String resAdd1,
    String resAdd2,
    String resCity,
    String resState,
    String resCountry,
    String resPinCode,
    String nameOfOrg,
    String orgAdd1,
    String orgAdd2,
    String orgCity,
    String orgState,
    String orgCountry,
    String orgPinCode,
  }) async {
    prefs.setString($resAddress1, resAdd1);
    prefs.setString($resAddress2, resAdd2);
    prefs.setString($resCity, resCity);
    prefs.setString($resState, resState);
    prefs.setString($resCountry, resCountry);
    prefs.setString($resPinCode, resPinCode);
    prefs.setString($nameOfOrganisation, nameOfOrg);
    prefs.setString($orgAddress1, orgAdd1);
    prefs.setString($orgAddress2, orgAdd2);
    prefs.setString($orgCity, orgCity);
    prefs.setString($orgState, orgState);
    prefs.setString($orgCountry, orgCountry);
    prefs.setString($orgPinCode, orgPinCode);
  }

  Future<void> setEducationDetails({
    String qualDegree,
    String qualDiploma,
    String qualOther,
    String collegeName,
    String univversityName,
    String otherInstitureName,
    String yearOfPassingDiploma,
    String masterUniversityName,
    String studyCenterName,
    String yearOfPassingMaster,
    String yearOfPassingPhD,
    String currentlyWorking,
    String currentProfStatus,
    String currentDesignation,
  }) async {
    prefs.setString($qualificationDegree, qualDegree);
    prefs.setString($qualificationDiploma, qualDiploma);
    prefs.setString($qualificationOther, qualOther);
    prefs.setString($collegeName, collegeName);
    prefs.setString($universityName, univversityName);
    prefs.setString($otherInstituteName, otherInstitureName);
    prefs.setString($yearOfPassingDiploma, yearOfPassingDiploma);
    prefs.setString($masterUniversityName, masterUniversityName);
    prefs.setString($studyCenterName, studyCenterName);
    prefs.setString($yearOfPassingMaster, yearOfPassingMaster);
    prefs.setString($yearOfPassingPhD, yearOfPassingPhD);
    prefs.setString($currentlyWorking, currentlyWorking);
    prefs.setString($currentProfStatus, currentProfStatus);
    prefs.setString($currentDesignation, currentDesignation);
  }

  Future<void> setDoctorData(DoctorModel doctorData) async {
    prefs.setString($name, doctorData.name);
    prefs.setString($dob, doctorData.dateOfBirth);
    prefs.setString($fatherName, doctorData.fatherName);
    prefs.setString($gender, doctorData.gender);
    prefs.setString($email, doctorData.emailAddress);
    prefs.setString($mobile, doctorData.mobileNumber);
    prefs.setString($aadhaarNumber, doctorData.aadhaarNumber);

    prefs.setString($resAddress1, doctorData.resAddress1);
    prefs.setString($resAddress2, doctorData.resAddress2);
    prefs.setString($resCity, doctorData.resCity);
    prefs.setString($resState, doctorData.resState);
    prefs.setString($resCountry, doctorData.residentialCountry);
    prefs.setString($resPinCode, doctorData.resPincode);
    prefs.setString($nameOfOrganisation, doctorData.nameOfOrganisation);
    prefs.setString($orgAddress1, doctorData.orgAddress1);
    prefs.setString($orgAddress2, doctorData.orgAddress2);
    prefs.setString($orgCity, doctorData.orgCity);
    prefs.setString($orgState, doctorData.orgState);
    prefs.setString($orgCountry, doctorData.countryOfOrganisation);
    prefs.setString($orgPinCode, doctorData.orgPincode);

    prefs.setString(
        $qualificationDegree, doctorData.optometryQualificationDegree);
    prefs.setString(
        $qualificationDiploma, doctorData.optometryQualificationDiploma);
    prefs.setString(
        $qualificationOther, doctorData.optometryQualificationOthers);
    prefs.setString($collegeName, doctorData.collegeName);
    prefs.setString($universityName, doctorData.universityName);
    prefs.setString($otherInstituteName, doctorData.otherInstitution);
    prefs.setString($yearOfPassingDiploma, doctorData.yearOfPassingDiploma);
    prefs.setString($masterUniversityName, doctorData.masterUniversityName);
    prefs.setString($studyCenterName, doctorData.studyCenterName);
    prefs.setString($yearOfPassingMaster, doctorData.yearOfPassingMaster);
    prefs.setString($yearOfPassingPhD, doctorData.yearOfPassingPhd);
    prefs.setString($currentlyWorking, doctorData.currentlyWorking);
    prefs.setString($currentProfStatus, doctorData.currentProfStatus);
    prefs.setString($currentDesignation, doctorData.currentDesignation);
  }

  Future<void> saveAccessToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('token', token);
  }

  Future<void> saveRegistrationId(String registrationId) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('registration', registrationId);
  }

  Future<String> getRegistrationId() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('registration') ?? null;
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();

    bool isLogged = (prefs.getString('token') != null) ? true : false;

    return isLogged;
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('token') ?? null;
  }

  Future<bool> clearToken() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.clear();
  }

  Future<void> saveCEPoints(String cePoints) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('ce_points', cePoints);
  }

  Future<String> getCEPoints() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString('ce_points') ?? null;
  }
}
