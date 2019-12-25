## person_ja_JP は日本語用のランダム名前生成モジュールです。
##
## 使用例
## ------
##

include interfaces

const
  formatsFemale = @[
    "$lastName $firstNameFemale",
  ]

  formatsMale = @[
    "$lastName $firstNameMale",
  ]

  formats = formatsMale & formatsFemale

  firstNamesFemale = @[
    "明美",
    "あすか",
    "香織",
    "加奈",
    "くみ子",
    "さゆり",
    "知実",
    "千代",
    "直子",
    "七夏",
    "花子",
    "春香",
    "真綾",
    "舞",
    "美加子",
    "幹",
    "桃子",
    "結衣",
    "裕美子",
    "陽子",
    "里佳",
  ]

  firstNamesMale = @[
    "晃",
    "篤司",
    "治",
    "和也",
    "京助",
    "健一",
    "修平",
    "翔太",
    "淳",
    "聡太郎",
    "太一",
    "太郎",
    "拓真",
    "翼",
    "智也",
    "直樹",
    "直人",
    "英樹",
    "浩",
    "学",
    "充",
    "稔",
    "裕樹",
    "裕太",
    "康弘",
    "陽一",
    "洋介",
    "亮介",
    "涼平",
    "零",
  ]

  firstNames = firstNamesMale & firstNamesFemale

  lastNames = @[
    "青田", "青山", "石田", "井高", "伊藤", "井上", "宇野", "江古田", "大垣",
    "加藤", "加納", "喜嶋", "木村", "桐山", "工藤", "小泉", "小林", "近藤",
    "斉藤", "坂本", "佐々木", "佐藤", "笹田", "鈴木", "杉山",
    "高橋", "田中", "田辺", "津田",
    "中島", "中村", "渚", "中津川", "西之園", "野村",
    "原田", "浜田", "廣川", "藤本",
    "松本", "三宅", "宮沢", "村山",
    "山岸", "山口", "山田", "山本", "吉田", "吉本",
    "若松", "渡辺",
  ]

  kanaFormats = @[
    "$lastKanaName $firstKanaNameFemale",
    "$lastKanaName $firstKanaNameMale",
  ]

  firstKanaNamesFemale = @[
    "アキラ", "アケミ", "アスカ",
    "カオリ", "カナ", "クミコ",
    "サユリ",
    "チヨ", "ツバサ", "トモミ",
    "ナオコ", "ナナカ",
    "ハナコ", "ハルカ",
    "マアヤ", "マイ", "ミキ", "モモコ",
    "ユイ", "ヨウコ", "ユミコ",
    "レイ", "リカ",
  ]

  firstKanaNamesMale = @[
    "アキラ", "アツシ", "オサム",
    "キョウスケ", "ケンイチ",
    "ジュン", "ソウタロウ",
    "タイチ", "タクマ", "タロウ", "ツバサ", "トモヤ",
    "ナオキ", "ナオト",
    "ヒデキ", "ヒロシ",
    "マナブ", "ミツル", "ミノル", "ヒロキ",
    "ユウタ", "ヤスヒロ", "ヨウイチ", "ヨウスケ",
    "リョウスケ", "リョウヘイ",
  ]

  firstKanaNames = firstKanaNamesMale & firstKanaNamesFemale

  lastKanaNames = @[
    "アオタ", "アオヤマ", "イシダ", "イダカ", "イトウ", "ウノ", "エコダ", "オオガキ",
    "カノウ", "カノウ", "キジマ", "キムラ", "キリヤマ", "クドウ", "コイズミ", "コバヤシ", "コンドウ",
    "サイトウ", "サカモト", "ササキ", "サトウ", "ササダ", "スズキ", "スギヤマ",
    "タカハシ", "タナカ", "タナベ", "ツダ", "ツチヤ",
    "ナカジマ", "ナカムラ", "ナギサ", "ナカツガワ", "ニシノソノ", "ノムラ",
    "ハラダ", "ハマダ", "ヒロカワ", "フジモト",
    "マツモト", "ミヤケ", "ミヤザワ", "ムラヤマ",
    "ヤマギシ", "ヤマグチ", "ヤマダ", "ヤマモト", "ヨシダ", "ヨシモト",
    "ワカマツ", "ワタナベ",
  ]

  romanizedFormats = @[
    "$firstRomanizedNameFemale $lastRomanizedName",
    "$firstRomanizedNameMale $lastRomanizedName",
  ]

  firstRomanizedNamesFemale = @[
    "Akira", "Akemi", "Asuka",
    "Kaori", "Kana", "Kumiko",
    "Sayuri",
    "Chiyo", "Tsubasa", "Tomomi",
    "Naoko", "Nanaka",
    "Hanako", "Haruka",
    "Maaya", "Mai", "Miki", "Momoko",
    "Yui", "Yoko", "Yumiko",
    "Rei", "Rika",
  ]

  firstRomanizedNamesMale = @[
    "Akira", "Atsushi", "Osamu",
    "Kyosuke", "Kenichi",
    "Jun", "Sotaro",
    "Taichi", "Takuma", "Taro", "Tsubasa", "Tomoya",
    "Naoki", "Naoto",
    "Hideki", "Hiroshi",
    "Manabu", "Mituru", "Minoru", "Hiroki",
    "Yuta", "Yasuhiro", "Yoichi", "Yosuke",
    "Ryosuke", "Ryohei",
  ]

  firstRomanizedNames = firstRomanizedNamesMale & firstRomanizedNamesFemale

  lastRomanizedNames = @[
    "Aota",
    "Aoyama",
    "Ishida",
    "Idaka",
    "Ito",
    "Uno",
    "Ekoda",
    "Ogaki",
    "Kato",
    "Kano",
    "Kijima",
    "Kimura",
    "Kiriyama",
    "Kudo",
    "Koizumi",
    "Kobayashi",
    "Kondo",
    "Saito",
    "Sakamoto",
    "Sasaki",
    "Sato",
    "Sasada",
    "Suzuki",
    "Sugiyama",
    "Takahashi",
    "Tanaka",
    "Tanabe",
    "Tsuda",
    "Tsuchiya",
    "Nakajima",
    "Nakamura",
    "Nagisa",
    "Nakatsugawa",
    "Nishinosono",
    "Nomura",
    "Harada",
    "Hamada",
    "Hirokawa",
    "Fujimoto",
    "Matsumoto",
    "Miyake",
    "Miyagawa",
    "Murayama",
    "Yamagishi",
    "Yamaguchi",
    "Yamada",
    "Yamamoto",
    "Yoshida",
    "Yoshimoto",
    "Wakamatsu",
    "Watanabe",
  ]

proc firstKanaNameFemale*(f: Faker): string
proc firstKanaNameMale*(f: Faker): string
proc firstKanaName*(f: Faker): string
proc lastKanaName*(f: Faker): string
proc firstRomanizedNameFemale*(f: Faker): string
proc firstRomanizedNameMale*(f: Faker): string
proc firstRomanizedName*(f: Faker): string
proc lastRomanizedName*(f: Faker): string

proc kanaName*(f: Faker): string
proc romanizedName*(f: Faker): string

proc format(f: Faker, fmt: string): string =
  let
    firstNameFemale = f.rand.sample(firstNamesFemale)
    firstNameMale = f.rand.sample(firstNamesMale)
    lastName = f.rand.sample(lastNames)
    firstKanaNameFemale = f.rand.sample(firstKanaNamesFemale)
    firstKanaNameMale = f.rand.sample(firstKanaNamesMale)
    firstKanaName = f.rand.sample(firstKanaNames)
    lastKanaName = f.rand.sample(lastKanaNames)
    firstRomanizedNameFemale = f.rand.sample(firstRomanizedNamesFemale)
    firstRomanizedNameMale = f.rand.sample(firstRomanizedNamesMale)
    firstRomanizedName = f.rand.sample(firstRomanizedNames)
    lastRomanizedName = f.rand.sample(lastRomanizedNames)
  fmt % @[
    "firstNameFemale", firstNameFemale,
    "firstNameMale", firstNameMale,
    "lastName", lastName,
    "firstKanaNameFemale", firstKanaNameFemale,
    "firstKanaNameMale", firstKanaNameMale,
    "firstKanaName", firstKanaName,
    "lastKanaName", lastKanaName,
    "firstRomanizedNameFemale", firstRomanizedNameFemale,
    "firstRomanizedNameMale", firstRomanizedNameMale,
    "firstRomanizedName", firstRomanizedName,
    "lastRomanizedName", lastRomanizedName,
    ]

genSampleProc ja_JP, [
    (firstName, firstNames, "ランダムに名前を返却する。"),
    (firstNameFemale, firstNamesFemale, "ランダムに女性の名前を返却する。"),
    (firstNameMale, firstNamesMale, "ランダムに男性の名前を返却する。"),
    (lastName, lastNames, "ランダムに名字を返却する。"),
    (lastNameFemale, lastNames, "ランダムに名字を返却する。"),
    (lastNameMale, lastNames, "ランダムに名字を返却する。"),
    (firstKanaNameFemale, firstKanaNamesFemale, "ランダムに女性のかな名を返却する。"),
    (firstKanaNameMale, firstKanaNamesMale, "ランダムに男性のかな名を返却する。"),
    (firstKanaName, firstKanaNames, "ランダムにかな名を返却する。"),
    (lastKanaName, lastKanaNames, "ランダムにかな名字を返却する。"),
    (firstRomanizedNameFemale, firstRomanizedNamesFemale, "ランダムに女性のローマ字名を返却する。"),
    (firstRomanizedNameMale, firstRomanizedNamesMale, "ランダムに男性のローマ字名を返却する。"),
    (firstRomanizedName, firstRomanizedNames, "ランダムにローマ字名を返却する。"),
    (lastRomanizedName, lastRomanizedNames, "ランダムにローマ字名字を返却する。"),
  ]

genSampleFormatProc ja_JP, [
    (nameFemale, formatsFemale, "ランダムに女性のフルネームを返却する。"),
    (nameMale, formatsMale, "ランダムに男性のフルネームを返却する。"),
    (name, formats, "ランダムにフルネームを返却する。"),
    (kanaName, kanaFormats, "ランダムにかなフルネームを返却する。"),
    (romanizedName, romanizedFormats, "ランダムにローマ字フルネームを返却する。"),
  ]

proc prefix*(f: Faker): string = discard
proc prefixFemale*(f: Faker): string = discard
proc prefixMale*(f: Faker): string = discard
proc suffix*(f: Faker): string = discard
proc suffixFemale*(f: Faker): string = discard
proc suffixMale*(f: Faker): string = discard
