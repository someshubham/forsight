import 'package:forsight/src/models/doctor_model.dart';
import 'package:forsight/src/models/event_model.dart';
import 'package:forsight/src/models/user_model.dart';
import 'forsight_shared_pref.dart';
import 'forsight_api_provider.dart';



class Repository{

  final _apiProvider = ForsightApiProvider();
  final _prefProvider = ForsightSharedPrefs();

  Future<List<EventModel>> fetchEvents() async {
    return await _apiProvider.fetchEvents();
  }


  Future<bool> loginUser(String username,String password) async {

    String token = await _apiProvider.loginOptometristWithUsernamePassword(username, password);

    if(token == null) {
      return false;
    }

    _prefProvider.saveAccessToken(token);
    return true;
    
    
  }

  Future<UserModel> getLoginData() async {
    String token = await _prefProvider.getToken();

    return await _apiProvider.loginOptometristWithAccessToken(token);
  }

  Future<DoctorModel> getUserData() async {

    String token = await _prefProvider.getToken();
    
    DoctorModel doctorData = await _apiProvider.loginAndGetOptometristDetailWithToken(token);

    _prefProvider.saveRegistrationId(doctorData.registrationId);

    return doctorData;
  }

  

  updateUser(String name,String dob,String mobile,
  String email,String qualification,String college,String address) async{
    String token = await _prefProvider.getToken();
    print(token);
    print(name);
    print(dob);
    print(mobile);
    await _apiProvider.updateUser(token, name, dob, mobile, email, qualification, college, address);
  } 


}