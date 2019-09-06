import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/event_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'forsight_shared_pref.dart';
import 'forsight_api_provider.dart';

class Repository {
  final _apiProvider = ForsightApiProvider();
  final _prefProvider = ForsightSharedPrefs();

  Future<List<EventModel>> fetchEvents() async {
    return await _apiProvider.fetchEvents();
  }

  Future<bool> loginUser(String username, String password) async {
    String token = await _apiProvider.loginOptometristWithUsernamePassword(
        username, password);

    if (token == null) {
      return false;
    }

    _prefProvider.saveAccessToken(token);
    return true;
  }

  Future<UserModel> getLoginData() async {
    String token = await _prefProvider.getToken();
    UserModel user = await _apiProvider.loginOptometristWithAccessToken(token);
    return user;
  }

  Future<int> getCEPoints() async {
    String token = await _prefProvider.getToken();
    print('token for CE Points is $token');
    return await _apiProvider.fetchCEPoints(token);
  }

  updateCEPoints(int cePoints) async {
    String token = await _prefProvider.getToken();
    return await _apiProvider.updateCEPoints(
        token: token, cePoints: cePoints.toString());
  }

  Future<DoctorModel> getUserData() async {
    String token = await _prefProvider.getToken();

    DoctorModel doctorData =
        await _apiProvider.loginAndGetOptometristDetailWithToken(token);

    await saveDataToSharedPrefs(doctorData);

    _prefProvider.saveRegistrationId(doctorData.registrationId);

    return doctorData;
  }

  updateUser(String name, String dob, String mobile, String email,
      String qualification, String college, String address) async {
    String token = await _prefProvider.getToken();
    await _apiProvider.updateUser(
      token: token,
      name: name,
      dob: dob,
      mobile: mobile,
      email: email,
      //qualification:qualification,
      //college:college,
      //address:address
    );
  }

  updateUserPersonalDetails({
    String name,
    String dob,
    String fatherName,
    String gender,
    String email,
    String mobile,
    String aadhaar,
  }) async {
    String token = await _prefProvider.getToken();

    await _prefProvider.setUserDetails(
      name: name,
      dob: dob,
      fatherName: fatherName,
      gender: gender,
      email: email,
      mobile: mobile,
      aadhaar: aadhaar,
    );

    await _apiProvider.updateUser(
      token: token,
      name: name,
      dob: dob,
      fatherName: fatherName,
      gender: gender,
      email: email,
      mobile: mobile,
      aadhaarNumber: aadhaar,
    );
  }

  updateUserEducationDetails({
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
    String token = await _prefProvider.getToken();

    await _prefProvider.setEducationDetails(
      qualDegree: qualDegree,
      qualDiploma: qualDiploma,
      qualOther: qualOther,
      collegeName: collegeName,
      univversityName: univversityName,
      otherInstitureName: otherInstitureName,
      yearOfPassingDiploma: yearOfPassingDiploma,
      yearOfPassingMaster: yearOfPassingMaster,
      yearOfPassingPhD: yearOfPassingPhD,
      studyCenterName: studyCenterName,
      currentlyWorking: currentlyWorking,
      currentProfStatus: currentProfStatus,
      currentDesignation: currentDesignation,
    );

    await _apiProvider.updateUser(
      token: token,
      qualificationDegree: qualDegree,
      qualificationDiploma: qualDiploma,
      qualificationOther: qualOther,
      collegeName: collegeName,
      universityName: univversityName,
      otherInstituteName: otherInstitureName,
      yearOfPassingDiploma: yearOfPassingDiploma,
      yearOfPassingMaster: yearOfPassingMaster,
      yearOfPassingPhD: yearOfPassingPhD,
      studyCenterName: studyCenterName,
      currentlyWorking: currentlyWorking,
      currentProfStatus: currentProfStatus,
      currentDesignation: currentDesignation,
    );
  }

  updateUserLocationDetails({
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
    String token = await _prefProvider.getToken();

    await _prefProvider.setLocationDetails(
      resAdd1: resAdd1,
      resAdd2: resAdd2,
      resCity: resCity,
      resCountry: resCountry,
      resPinCode: resPinCode,
      resState: resState,
      nameOfOrg: nameOfOrg,
      orgAdd1: orgAdd1,
      orgAdd2: orgAdd2,
      orgCity: orgCity,
      orgState: orgState,
      orgCountry: orgCountry,
      orgPinCode: orgPinCode,
    );

    await _apiProvider.updateUser(
      token: token,
      resAddress1: resAdd1,
      resAddress2: resAdd2,
      resCity: resCity,
      resCountry: resCountry,
      resPinCode: resPinCode,
      resState: resState,
      nameOfOrganisation: nameOfOrg,
      orgAddress1: orgAdd1,
      orgAddress2: orgAdd2,
      orgCity: orgCity,
      orgState: orgState,
      orgCountry: orgCountry,
      orgPinCode: orgPinCode,
    );
  }

  Future<void> saveDataToSharedPrefs(DoctorModel doctorData) async {
    await _prefProvider.setDoctorData(doctorData);
  }
}
