import 'package:forsight/src/models/doctor_model.dart';
import 'package:rxdart/rxdart.dart';
import '../resources/repository.dart';

class UpdateBloc {
  final _repo = Repository();

  // These are for personal details
  final _nameController = BehaviorSubject<String>();
  final _dobController = BehaviorSubject<String>();
  final _fatherNameController = BehaviorSubject<String>();
  final _genderController = BehaviorSubject<String>();
  final _mobileController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _aadhaarController = BehaviorSubject<String>();

  //These are for qualification details
  final _qualDegreeController = BehaviorSubject<String>();
  final _qualDiplomaController = BehaviorSubject<String>();
  final _qualOtherController = BehaviorSubject<String>();
  final _collegeNameController = BehaviorSubject<String>();
  final _universityNameController = BehaviorSubject<String>();
  final _otherInstituteNameController = BehaviorSubject<String>();
  final _yearOfPassingDiplomaController = BehaviorSubject<String>();
  final _masterUniversityNameController = BehaviorSubject<String>();
  final _studyCenterNameController = BehaviorSubject<String>();
  final _yearOfPassingMasterController = BehaviorSubject<String>();
  final _yearOfPassingPhDController = BehaviorSubject<String>();
  final _currentlyWorkingController = BehaviorSubject<String>();
  final _currentProfStatusController = BehaviorSubject<String>();
  final _currentDesignationController = BehaviorSubject<String>();

  //These are for address Details
  final _resAddress1Controller = BehaviorSubject<String>();
  final _resAddress2Controller = BehaviorSubject<String>();
  final _resCityController = BehaviorSubject<String>();
  final _resStateController = BehaviorSubject<String>();
  final _resCountryController = BehaviorSubject<String>();
  final _resPinCodeController = BehaviorSubject<String>();
  final _nameOfOrganisationController = BehaviorSubject<String>();
  final _orgAddress1Controller = BehaviorSubject<String>();
  final _orgAddress2Controller = BehaviorSubject<String>();
  final _orgCityController = BehaviorSubject<String>();
  final _orgStateController = BehaviorSubject<String>();
  final _orgCountryController = BehaviorSubject<String>();
  final _orgPinCodeController = BehaviorSubject<String>();

  final _qualificationController = BehaviorSubject<String>();
  final _collegeController = BehaviorSubject<String>();
  final _addressController = BehaviorSubject<String>();

  // These are for personal Details
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeDob => _dobController.sink.add;
  Function(String) get changeMobile => _mobileController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeFatherName => _fatherNameController.sink.add;
  Function(String) get changeGender => _genderController.sink.add;
  Function(String) get changeAadhaar => _aadhaarController.sink.add;

  //These are for qualification details
  Function(String) get changeQualDegree => _qualDegreeController.sink.add;
  Function(String) get changeQualDiploma => _qualDiplomaController.sink.add;
  Function(String) get changeQualOther => _qualOtherController.sink.add;
  Function(String) get changeCollegeName => _collegeNameController.sink.add;
  Function(String) get changeUniversityName =>
      _universityNameController.sink.add;
  Function(String) get changeOtherInstituteName =>
      _otherInstituteNameController.sink.add;
  Function(String) get changeYearOfPassing =>
      _yearOfPassingDiplomaController.sink.add;
  Function(String) get changeMasterUniversityName =>
      _masterUniversityNameController.sink.add;
  Function(String) get changeStudyCenterName =>
      _studyCenterNameController.sink.add;
  Function(String) get changeYearOfPassingMaster =>
      _yearOfPassingMasterController.sink.add;
  Function(String) get changeYearOfPassingPhD =>
      _yearOfPassingPhDController.sink.add;
  Function(String) get changeCurrentlyWorking =>
      _currentlyWorkingController.sink.add;
  Function(String) get changeCurrentProfStatus =>
      _currentProfStatusController.sink.add;
  Function(String) get changeCurrentDesignation =>
      _currentDesignationController.sink.add;

//These are for address details
  Function(String) get changeResAdd1 => _resAddress1Controller.sink.add;
  Function(String) get changeResAdd2 => _resAddress2Controller.sink.add;
  Function(String) get changeResCity => _resCityController.sink.add;
  Function(String) get changeResState => _resStateController.sink.add;
  Function(String) get changeResCountry => _resCountryController.sink.add;
  Function(String) get changeResPinCode => _resPinCodeController.sink.add;
  Function(String) get changeNameOfOrganisation =>
      _nameOfOrganisationController.sink.add;
  Function(String) get changeOrgAdd1 => _orgAddress1Controller.sink.add;
  Function(String) get changeOrgAdd2 => _orgAddress2Controller.sink.add;
  Function(String) get changeOrgCity => _orgCityController.sink.add;
  Function(String) get changeOrgState => _orgStateController.sink.add;
  Function(String) get changeOrgCountry => _orgCountryController.sink.add;
  Function(String) get changeOrgPinCode => _orgPinCodeController.sink.add;

  Function(String) get changeQualification => _qualificationController.sink.add;
  Function(String) get changeCollege => _collegeController.sink.add;
  Function(String) get changeAddress => _addressController.sink.add;

  // These are for personal details
  Observable<String> get name => _nameController.stream;
  Observable<String> get dob => _dobController.stream;
  Observable<String> get mobile => _mobileController.stream;
  Observable<String> get email => _emailController.stream;
  Observable<String> get fatherName => _fatherNameController.stream;
  Observable<String> get gender => _genderController.stream;
  Observable<String> get aadhaar => _aadhaarController.stream;

//These are for qualification details
  Observable<String> get qualDegree => _qualDegreeController.stream;
  Observable<String> get qualDiploma => _qualDiplomaController.stream;
  Observable<String> get qualOther => _qualOtherController.stream;
  Observable<String> get collegeName => _collegeNameController.stream;
  Observable<String> get univversityName => _universityNameController.stream;
  Observable<String> get otherInstitureName =>
      _otherInstituteNameController.stream;
  Observable<String> get yearOfPassingDiploma =>
      _yearOfPassingDiplomaController.stream;
  Observable<String> get masterUniversityName =>
      _masterUniversityNameController.stream;
  Observable<String> get studyCenterName => _studyCenterNameController.stream;
  Observable<String> get yearOfPassingMaster =>
      _yearOfPassingMasterController.stream;
  Observable<String> get yearOfPassingPhD => _yearOfPassingPhDController.stream;
  Observable<String> get currentlyWorking => _currentlyWorkingController.stream;
  Observable<String> get currentProfStatus =>
      _currentProfStatusController.stream;
  Observable<String> get currentDesignation =>
      _currentDesignationController.stream;

//These are for address Details
  Observable<String> get resAdd1 => _resAddress1Controller.stream;
  Observable<String> get resAdd2 => _resAddress2Controller.stream;
  Observable<String> get resCity => _resCityController.stream;
  Observable<String> get resState => _resStateController.stream;
  Observable<String> get resCountry => _resCountryController.stream;
  Observable<String> get resPinCode => _resPinCodeController.stream;
  Observable<String> get nameOfOrg => _nameOfOrganisationController.stream;
  Observable<String> get orgAdd1 => _orgAddress1Controller.stream;
  Observable<String> get orgAdd2 => _orgAddress2Controller.stream;
  Observable<String> get orgCity => _orgCityController.stream;
  Observable<String> get orgState => _orgStateController.stream;
  Observable<String> get orgCountry => _orgCountryController.stream;
  Observable<String> get orgPinCode => _orgPinCodeController.stream;

  Observable<String> get qualification => _qualificationController.stream;
  Observable<String> get college => _collegeController.stream;
  Observable<String> get address => _addressController.stream;

  submit() {
    var name = _nameController.value;
    var dob = _dobController.value;
    var mobile = _mobileController.value;
    var email = _emailController.value;
    var qualification = _qualificationController.value;
    var college = _collegeController.value;
    var address = _addressController.value;

    _repo.updateUser(name, dob, mobile, email, qualification, college, address);
  }

  submitPersonalDetail() async {
    var name = _nameController.value;
    var dob = _dobController.value;
    var mobile = _mobileController.value;
    var email = _emailController.value;
    var fatherName = _fatherNameController.value;
    var gender = _genderController.value;
    var aadhaar = _aadhaarController.value;

    await _repo.updateUserPersonalDetails(
      name: name,
      dob: dob,
      mobile: mobile,
      email: email,
      fatherName: fatherName,
      gender: gender,
      aadhaar: aadhaar,
    );
  }

  submitEducationDetail() async {
    var qualDegree = _qualDegreeController.value;
    var qualDiploma = _qualDiplomaController.value;
    var qualOther = _qualOtherController.value;
    var collegeName = _collegeNameController.value;
    var univversityName = _universityNameController.value;
    var otherInstitureName = _otherInstituteNameController.value;
    var yearOfPassingDiploma = _yearOfPassingDiplomaController.value;
    var masterUniversityName = _masterUniversityNameController.value;
    var studyCenterName = _studyCenterNameController.value;
    var yearOfPassingMaster = _yearOfPassingMasterController.value;
    var yearOfPassingPhD = _yearOfPassingPhDController.value;
    var currentlyWorking = _currentlyWorkingController.value;
    var currentProfStatus = _currentProfStatusController.value;
    var currentDesignation = _currentDesignationController.value;

    await _repo.updateUserEducationDetails(
      qualDegree: qualDegree,
      qualDiploma: qualDiploma,
      qualOther: qualOther,
      collegeName: collegeName,
      univversityName: univversityName,
      otherInstitureName: otherInstitureName,
      yearOfPassingDiploma: yearOfPassingDiploma,
      masterUniversityName: masterUniversityName,
      studyCenterName: studyCenterName,
      yearOfPassingMaster: yearOfPassingMaster,
      yearOfPassingPhD: yearOfPassingPhD,
      currentlyWorking: currentlyWorking,
      currentProfStatus: currentProfStatus,
      currentDesignation: currentDesignation,
    );
  }

  submitLocationDetail() async {
    var resAdd1 = _resAddress1Controller.value;
    var resAdd2 = _resAddress2Controller.value;
    var resCity = _resCityController.value;
    var resState = _resStateController.value;
    var resCountry = _resCountryController.value;
    var resPinCode = _resPinCodeController.value;
    var nameOfOrg = _nameOfOrganisationController.value;
    var orgAdd1 = _orgAddress1Controller.value;
    var orgAdd2 = _orgAddress2Controller.value;
    var orgCity = _orgCityController.value;
    var orgState = _orgStateController.value;
    var orgCountry = _orgCountryController.value;
    var orgPinCode = _orgPinCodeController.value;

    await _repo.updateUserLocationDetails(
      resAdd1: resAdd1,
      resAdd2: resAdd2,
      resCity: resCity,
      resState: resState,
      resCountry: resCountry,
      resPinCode: resPinCode,
      nameOfOrg: nameOfOrg,
      orgAdd1: orgAdd1,
      orgAdd2: orgAdd2,
      orgCity: orgCity,
      orgState: orgState,
      orgCountry: orgCountry,
      orgPinCode: orgPinCode,
    );
  }

  dispose() {
    _nameController.close();
    _dobController.close();
    _mobileController.close();
    _emailController.close();
    _qualificationController.close();
    _collegeController.close();
    _addressController.close();
    _fatherNameController?.close();
    _aadhaarController?.close();
    _genderController?.close();
    _qualDegreeController?.close();
    _qualDiplomaController?.close();
    _qualOtherController?.close();
    _collegeNameController?.close();
    _universityNameController?.close();
    _otherInstituteNameController?.close();
    _yearOfPassingDiplomaController?.close();
    _masterUniversityNameController?.close();
    _studyCenterNameController?.close();
    _yearOfPassingMasterController?.close();
    _yearOfPassingPhDController?.close();
    _currentlyWorkingController?.close();
    _currentProfStatusController?.close();
    _currentDesignationController?.close();
    _resAddress1Controller?.close();
    _resAddress2Controller?.close();
    _resCityController?.close();
    _resStateController?.close();
    _resCountryController?.close();
    _resPinCodeController?.close();
    _nameOfOrganisationController?.close();
    _orgAddress1Controller?.close();
    _orgAddress2Controller?.close();
    _orgCityController?.close();
    _orgStateController?.close();
    _orgCountryController?.close();
    _orgPinCodeController?.close();
  }
}
