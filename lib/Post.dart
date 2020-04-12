class Post{
  int _id;
  int _userId;
  String _title;
  String _body;

  Post(this._userId, this._id, this._title, this._body);

  // Getter and Setter for _body
  String get body => _body;

  set body(String value){
    _body = value;
  }
  // Getter and Setter for _title
  String get title => _title;

  set title(String value){
    _title = value;
  }
  // Getter and Setter for _id
  int get id => _id;

  set id(int value){
    _id = value;
  }
  // Getter and Setter for _userId
  int get userId => _userId;

  set userId(int value){
    _userId = value;
  }
}