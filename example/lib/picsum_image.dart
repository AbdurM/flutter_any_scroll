class PicSumImage {
  PicSumImage({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  PicSumImage.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    author = json['author'] as String;
    width = json['width'] as int;
    height = json['height'] as int;
    url = json['url'] as String;
    downloadUrl = json['download_url'] as String;
  }

  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['author'] = author;
    data['width'] = width;
    data['height'] = height;
    data['url'] = url;
    data['download_url'] = downloadUrl;
    return data;
  }
}
