import 'package:flutter/foundation.dart';
import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'package:forsight/src/resources/forsight_shared_pref.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/event_model.dart';

final String _root = 'https://api.optometrycouncilofindia.org/api';
//final String _root = 'https://elseif.in/oci/api/';

class ForsightApiProvider {
  Client _client = Client();

  Future<List<EventModel>> fetchEvents() async {
    final response = await _client.get('$_root/get.php?method=oci_events');

    return (json.decode(response.body) as List).map((e) {
      return EventModel.fromJson(e);
    }).toList();
  }

  Future<String> loginOptometristWithUsernamePassword(
      String username, String password) async {
    final response = await _client.post(
      '$_root/post.php',
      body: json.encode({
        "key": "optometry_login",
        "user_name": username,
        "password_login": password
      }),
      headers: <String, String>{
        "Content-type": "application/json",
        "token": "2304d5f65a9273202dce611154ba0c93",
      },
    );

    //print('response is ${response.body}');
    Map<String, dynamic> resultMap =
        (json.decode(response.body) as Map<String, dynamic>);

    int result = resultMap['status'];
    return (result == 1) ? resultMap['result']['accessToken'] : null;
  }

  Future<UserModel> loginOptometristWithAccessToken(String token) async {
    final response =
        await _client.get('$_root/get.php?method=oci_login&accessToken=$token');

    //print('token : $token');
    //print('response for login ${response.body}');

    return (json.decode(response.body) as List)
        .map((e) {
          return UserModel.fromJson(e);
        })
        .toList()
        .first;
  }

  Future<DoctorModel> loginAndGetOptometristDetailWithToken(
      String token) async {
    final response = await _client
        .get('$_root/get.php?method=oci_registration_api&accessToken=$token');

    //print('token : $token');
    //print('response for login ${response.body}');

    return (json.decode(response.body) as List)
        .map((e) {
          return DoctorModel.fromJson(e);
        })
        .toList()
        .first;
  }

  updateCEPoints({@required String cePoints, @required String token}) async {
    final response = await _client.post(
      '$_root/post.php',
      body: json.encode({
        "key": "optometry_cepoints_update",
        "cePoints": cePoints,
        "accessToken": token,
      }),
    );

    print('response is ${response.body}');
  }

  Future<int> fetchCEPoints(String token) async {
    final response =
        await _client.get('$_root/get.php?method=oci_login&accessToken=$token');
    print(response.body);
    UserModel user = (json.decode(response.body) as List)
        .map((e) {
          return UserModel.fromJson(e);
        })
        .toList()
        .first;
    if (user.cePoints == null) {
      return 1;
    }
    return int.parse(user.cePoints);
  }

  updateUser({
    @required String token,
    // These are for Personal Details
    String name,
    String dob,
    String fatherName,
    String gender,
    String email,
    String mobile,
    String aadhaarNumber,
    // These are for location update
    // This is for residential address
    String resAddress1,
    String resAddress2,
    String resCity,
    String resState,
    String resCountry,
    String resPinCode,
    // This is for Organisation address
    String nameOfOrganisation,
    String orgAddress1,
    String orgAddress2,
    String orgCity,
    String orgState,
    String orgCountry,
    String orgPinCode,
    // This is for education and qualification
    String qualificationDiploma,
    String qualificationDegree,
    String qualificationOther,
    String collegeName,
    String universityName,
    String otherInstituteName,
    String yearOfPassingDiploma,
    String completedMaster,
    String masterUniversityName,
    String studyCenterName,
    String yearOfPassingMaster,
    String completedPhD,
    String yearOfPassingPhD,
    String currentlyWorking,
    String currentProfStatus,
    String currentDesignation,
  }) async {
    print(ForsightSharedPrefs.name);
    final response = await _client.post(
      '$_root/post.php',
      body: json.encode({
        "key": "optometry_register_update",
        "accessToken": token,
        "name": name ?? ForsightSharedPrefs.name,
        "date_of_birth": dob ?? ForsightSharedPrefs.dob,
        "father_name": fatherName ?? ForsightSharedPrefs.fatherName,
        "gender": gender ?? ForsightSharedPrefs.gender,
        "email_address": email ?? ForsightSharedPrefs.email,
        "mobile_number": mobile ?? ForsightSharedPrefs.mobile,
        "aadhaar_number": aadhaarNumber ?? ForsightSharedPrefs.aadhaarNumber,
        "res_address1": resAddress1 ?? ForsightSharedPrefs.resAddress1,
        "res_address2": resAddress2 ?? ForsightSharedPrefs.resAddress2,
        "res_city": resCity ?? ForsightSharedPrefs.resCity,
        "res_state": resState ?? ForsightSharedPrefs.resState,
        "residential_country": resCountry ?? ForsightSharedPrefs.resCountry,
        "res_pincode": resPinCode ?? ForsightSharedPrefs.resPinCode,
        "cou_address1": "Bengaluru",
        "cou_address2": "",
        "cou_city": "1558",
        "cou_state": "17",
        "courier_country": "101",
        "cou_pincode": "530068",
        "optometry_qualification_diploma":
            qualificationDiploma ?? ForsightSharedPrefs.qualificationDiploma,
        "optometry_qualification_degree":
            qualificationDegree ?? ForsightSharedPrefs.qualificationDegree,
        "optometry_qualification_others":
            qualificationOther ?? ForsightSharedPrefs.qualificationOther,
        "college_name":
            collegeName ?? ForsightSharedPrefs.collegeName, //college,
        "university_name": universityName ?? ForsightSharedPrefs.universityName,
        "other_institution":
            otherInstituteName ?? ForsightSharedPrefs.otherInstituteName,
        "year_of_passing_diploma":
            yearOfPassingDiploma ?? ForsightSharedPrefs.yearOfPassingDiploma,
        "duration": "none",
        "member_of_optometry": "9",
        "association_name": "",
        "membership_number": "",
        "completed_master": completedMaster,
        "master_university_name":
            masterUniversityName ?? ForsightSharedPrefs.masterUniversityName,
        "study_center_name":
            studyCenterName ?? ForsightSharedPrefs.studyCenterName,
        "year_of_passing_master":
            yearOfPassingDiploma ?? ForsightSharedPrefs.yearOfPassingDiploma,
        "completed_phd": completedPhD,
        "year_of_passing_phd":
            yearOfPassingPhD ?? ForsightSharedPrefs.yearOfPassingPhD,
        "currently_working":
            currentlyWorking ?? ForsightSharedPrefs.currentlyWorking,
        "photo":
            "files\/user-docs\/passport-size-photo\/C3D95C11-C8E0-48A4-B9C4-↵E221A2B06B69\/UuNLr",
        "current_prof_status":
            currentProfStatus ?? ForsightSharedPrefs.currentProfStatus,
        "current_designation":
            currentDesignation ?? ForsightSharedPrefs.currentDesignation,
        "name_of_organisation":
            nameOfOrganisation ?? ForsightSharedPrefs.nameOfOrganisation,
        "org_address1": orgAddress1 ?? ForsightSharedPrefs.orgAddress1,
        "org_address2": orgAddress2 ?? ForsightSharedPrefs.orgAddress2,
        "org_city": orgCity ?? ForsightSharedPrefs.orgCity,
        "org_state": orgState ?? ForsightSharedPrefs.orgState,
        "country_of_organisation": orgCountry ?? ForsightSharedPrefs.orgCountry,
        "org_pincode": orgPinCode ?? ForsightSharedPrefs.orgPinCode,
        "how_you_know": ""
      }),
    );

    print('response is ${response.body}');
    // Map<String, dynamic> resultMap =
    //   (json.decode(response.body) as Map<String, dynamic>);

    //int result = resultMap['status'];
    //print('$result');
    //return (result == 1) ? resultMap['result']['accessToken'] : null;
  }
}
