import 'package:forsight/src/models/doctor_model.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class UpdateBloc{

  final _repo = Repository();

  final _nameController = BehaviorSubject<String>();
  final _dobController = BehaviorSubject<String>();
  final _mobileController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _qualificationController = BehaviorSubject<String>();
  final _collegeController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeDob => _dobController.sink.add;
  Function(String) get changeMobile => _mobileController.sink.add;
  Function(String) get changeQualification => _qualificationController.sink.add;
  Function(String) get changeCollege => _collegeController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeAddress => _addressController.sink.add;


  Observable<String> get name => _nameController.stream;
  Observable<String> get dob => _dobController.stream;
  Observable<String> get mobile => _mobileController.stream;
  Observable<String> get email => _emailController.stream;
  Observable<String> get qualification => _qualificationController.stream;
  Observable<String> get college => _collegeController.stream;
  Observable<String> get address => _addressController.stream;

  submit(){
    
  var name = _nameController.value;
  print('name is $name');
  var dob = _dobController.value;
  var mobile = _mobileController.value;
  var email = _emailController.value;
  var qualification = _qualificationController.value;
  var college = _collegeController.value;
  var address = _addressController.value;

  DoctorModel doctor = DoctorModel(
    dateOfBirth: dob,
    mobileNumber: mobile,
    emailAddress: email,
    optometryQualificationDegree: qualification,
    collegeName: college,
    resAddress1: address,
    name: name
  );

    _repo.updateUser(name, dob, mobile, email, qualification, college, address);

  }


  dispose(){
    _nameController.close(); 
   _dobController.close(); 
   _mobileController.close(); 
   _emailController.close();
   _qualificationController.close();
   _collegeController.close(); 
   _addressController.close(); 

  }


}