import 'dart:math';

const List<String> country_list = [
  'アイスランド',
  'アイルランド',
  'アゼルバイジャン',
  'アフガニスタン',
  'アメリカ',
  'アラブ',
  'アルジェリア',
  'アルバニア',
  'アルメニア',
  'アンゴラ',
  'バーブーダ',
  'アンドラ',
  'イエメン',
  'イスラエル',
  'イタリア',
  'イラク',
  'イラン',
  'インド',
  'インドネシア',
  'ウガンダ',
  'ウクライナ',
  'ウズベキスタン',
  'ウルグアイ',
  'エクアドル',
  'エジプト',
  'エストニア',
  'エスワティニ',
  'エチオピア',
  'エリトリア',
  'エルサルバドル',
  'オーストラリア',
  'オーストリア',
  'オマーン',
  'オランダ',
  'ガーナ',
  'ガーボベルデ',
  'ガイアナ',
  'カザフスタン',
  'カタール',
  'カナダ',
  'ガボン',
  'カメルーン',
  'ガンビア',
  'カンボジア',
  'マケドニア',
  'ギニア',
  'ギニアビサウ',
  'キプロス',
  'キューバ',
  'ギリシャ',
  'キリバス',
  'キルギス',
  'グアテマラ',
  'クウェート',
  'クック',
  'グレナダ',
  'クロアチア',
  'ケニア',
  'コートジボワール',
  'コスタリカ',
  'コソボ',
  'コモロ',
  'コロンビア',
  'コンゴ',
  'サウジアラビア',
  'サモア',
  'サントメプリンシペ',
  'ザンビア',
  'サンマリノ',
  'シエラレオネ',
  'ジブチ',
  'ジャマイカ',
  'ジョージア',
  'シリア',
  'シンガポール',
  'ジンバブエ',
  'スイス',
  'スウェーデン',
  'スーダン',
  'スペイン',
  'スリナム',
  'スリランカ',
  'スロバキア',
  'スロベニア',
  'セーシェル',
  'セネガル',
  'セルビア',
  'セントルシア',
  'ソマリア',
  'ソロモン',
  'タイ',
  'カンコク',
  'タジキスタン',
  'タンザニア',
  'チェコ',
  'チャド',
  'チュウオウアフリカ',
  'チュウゴク',
  'チュニジア',
  'チリ',
  'ツバル',
  'デンマーク',
  'ドイツ',
  'トーゴ',
  'ドミニカ',
  'トリニダードトバゴ',
  'トルクメニスタン',
  'トルコ',
  'トンガ',
  'ナイジェリア',
  'ナウル',
  'ナミビア',
  'ニウア',
  'ニカラグア',
  'ニジェール',
  'ニュージーランド',
  'ネパール',
  'ノルウェー',
  'バーレーン',
  'ハイチ',
  'パキスタン',
  'バチカン',
  'パナマ',
  'バヌアツ',
  'バハマ',
  'パプアニューギニア',
  'パラオ',
  'パラグアイ',
  'バルバドス',
  'ハンガリー',
  'バングラデシュ',
  'ティモール',
  'フィジー',
  'フィリピン',
  'フィンランド',
  'ブータン',
  'ブラジル',
  'フランス',
  'ブルガリア',
  'ブルキナファソ',
  'ブルネイ',
  'ブルンジ',
  'ベトナム',
  'ベナン',
  'ベネズエラ',
  'ベラルーシ',
  'ベリーズ',
  'ペルー',
  'ベルギー',
  'ポーランド',
  'ボスニア',
  'ボツワナ',
  'ボリビア',
  'ポルトガル',
  'ホンジュラス',
  'マーシャル',
  'マダガスカル',
  'マラウイ',
  'マリ',
  'マルタ',
  'マレーシア',
  'ミクロネシア',
  'ミャンマー',
  'メキシコ',
  'モーリシャス',
  'モーリタニア',
  'モザンビーク',
  'モナコ',
  'モルディブ',
  'モルドバ',
  'モロッコ',
  'モンゴル',
  'モンテネグロ',
  'ヨルダン',
  'ラオス',
  'ラトビア',
  'リトアニア',
  'リビア',
  'リヒテンシュタイン',
  'リベリア',
  'ルーマニア',
  'ルクセンブルク',
  'ルワンダ',
  'レソト',
  'レバノン',
  'ロシア',
  'キタチョウセン',
  'タイワン',
];

class Randomizer {
  static var n = country_list.length;

  static String Generate() {
    List<String> array = [];
    var rand = Random();
    array.add(country_list[rand.nextInt(n)]);
    // 字数が10字に満たない時に空文字列を入れる
    if (array[0].length < 10) {
      (array[0] += " " * (10 - (array[0].length)));
    }
    return array.join('');
  }
}
