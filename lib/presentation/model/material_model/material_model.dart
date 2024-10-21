class MaterialContent {

  late String title;
  late String type; // article / video
  late String category; // tema materi
  late String source; // Cambridge, 
  late String coverUrl; // url image
  late String content; // kalo bentuk video -> link vid, kalo bentuk artikel -> teks
  late String description; 

  MaterialContent(this.title, this.type, this.category, this.source, this.coverUrl, this.content, this.description);

}