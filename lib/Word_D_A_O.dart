import 'package:dictionary_app/VeritabaniYardimcisi.dart';
import 'package:dictionary_app/Words.dart';

class words_D_A_O {

  Future<List<Words>> bring_all_words() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM kelimeler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Words(satir["kelime_id"], satir["turkce"], satir["ingilizce"]);
    });
  }


  Future<List<Words>> filter_char(String filter_char) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce LIKE '%$filter_char%' ");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Words(satir["kelime_id"], satir["turkce"], satir["ingilizce"]);
    });
  }

}