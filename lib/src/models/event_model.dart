
class EventModel {
  String eventId;//eventId
  String title;//title
  String url;//url
  String startDate;//start
  String endDate;//end
  String latitude;//latitude
  String longitude;//longitude
  String image;//image
  String desc;//description

  EventModel.fromJson(Map<String,dynamic> parsedJson){
    eventId = parsedJson['eventId'];
    title = parsedJson['title'];
    url = parsedJson['url'];
    startDate = parsedJson['start'];
    endDate = parsedJson['end'];
    latitude = parsedJson['latitude'];
    longitude = parsedJson['longitude'];
    image = parsedJson['image'];
    desc = parsedJson['description'];
  }


} 