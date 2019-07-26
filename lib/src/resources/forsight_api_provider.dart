import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../models/event_model.dart';

final String _root = 'https://www.elseif.in';

class ForsightApiProvider {
  Client _client = Client();

  Future<List<EventModel>> fetchEvents() async {
    final response =
        await _client.get('$_root/oci/api/get.php?method=oci_events');

    return (json.decode(response.body) as List).map((e) {
      return EventModel.fromJson(e);
    }).toList();
  }

  Future<String> loginOptometristWithUsernamePassword(
      String username, String password) async {
    final response = await _client.post(
      '$_root/oci/api/post.php',
      body: json.encode({
        "key": "optometry_login",
        "user_name": "appadmin",
        "password_login": "test123"
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
    final response = await _client
        .get('$_root/oci/api/get.php?method=oci_login&accessToken=$token');

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
    final response = await _client.get(
        '$_root/oci/api/get.php?method=oci_registration_api&accessToken=$token');

    print('token : $token');
    //print('response for login ${response.body}');

    return (json.decode(response.body) as List)
        .map((e) {
          return DoctorModel.fromJson(e);
        })
        .toList()
        .first;
  }

  updateUser(String token, String name, String dob, String mobile, String email,
      String qualification, String college, String address) async {
    final response = await _client.post(
      '$_root/oci/api/post.php',
      body: {
        "key": "optometry_register_update",
        "accessToken": token,
        "name": "Shubham",
        "date_of_birth": "12/08/97",
        "father_name": "",
        "gender": "Male",
        "email_address": "manshu2@gmail.com",
        "mobile_number": "appadmin",
        "aadhaar_number": "",
        "res_address1": "Bengaluru",
        "res_address2": "",
        "res_city": "1558",
        "res_state": "17",
        "residential_country": "101",
        "res_pincode": "530068",
        "cou_address1": "Bengaluru",
        "cou_address2": "",
        "cou_city": "1558",
        "cou_state": "17",
        "courier_country": "101",
        "cou_pincode": "530068",
        "optometry_qualification_diploma": "_none",
        "optometry_qualification_degree": "_none",
        "optometry_qualification_others": "",
        "college_name": "_none",
        "university_name": "",
        "other_institution": "",
        "year_of_passing_diploma": "0",
        "duration": "none",
        "member_of_optometry": "9",
        "association_name": "",
        "membership_number": "",
        "completed_master": "9",
        "master_university_name": "",
        "study_center_name": "",
        "year_of_passing_master": "0",
        "completed_phd": "9",
        "year_of_passing_phd": "0",
        "currently_working": "2",
        "photo":
            "files\/user-docs\/passport-size-photo\/C3D95C11-C8E0-48A4-B9C4-↵E221A2B06B69\/UuNLr",
        "current_prof_status": "Hospital",
        "current_designation": "",
        "name_of_organisation": "",
        "org_address1": "",
        "org_address2": "",
        "org_city": "",
        "org_state": "",
        "country_of_organisation": "",
        "org_pincode": "0",
        "how_you_know": ""
      },
      // headers: <String, String>{
      //   "Content-type": "application/json",
      //   "token": "2304d5f65a9273202dce611154ba0c93",
      // },
    );

    print('response is ${response.body}');
    // Map<String, dynamic> resultMap =
    //   (json.decode(response.body) as Map<String, dynamic>);

    //int result = resultMap['status'];
    //print('$result');
    //return (result == 1) ? resultMap['result']['accessToken'] : null;
  }
}
