class NoteModel{

  late int id;
  late String title;
  late String text;
  late DateTime? createdTime;

  NoteModel({required this.id, required this.title, required this.text, this.createdTime});

  NoteModel.fromJson(Map<String, Object?> json){
    id = json["id"] as int;
    title = json["title"] as String;
    text = json["text"] as String;
    createdTime = json["createdTime"] as DateTime;
  }

  Map<String, Object?> toJson() => {
    "id":id,
    "title":title,
    "text":text,
    "createdTime":createdTime,
  };


}