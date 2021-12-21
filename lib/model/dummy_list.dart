class Dummy {
  String personName;
  String textMessage;
  String imageUrl;
  String timeStamp;
  // cara 1
  // String personName = '';
  // String textMessage = '';
  // String imageUrl = '';
  // String timeStamp = '';

  // Dummy({required this.personName,required this.textMessage, required this.imageUrl, required this.timeStamp});

  Dummy(
      {this.personName = '',
      this.textMessage = '',
      this.imageUrl = '',
      this.timeStamp = ''});
}
