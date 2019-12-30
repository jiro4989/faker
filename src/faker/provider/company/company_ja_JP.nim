## company_ja_JP は日本語用のランダム会社名生成モジュールです。
##
## 使用例
## ------
##

runnableExamples:
  import faker/provider/company/company_ja_JP

  let fake = newFaker("ja_JP")
  echo fake.company()

from ../person import lastName

include interfaces

const
  formats = @[
    "$companyPrefix$lastName$companyCategory",
    "$lastName$companyCategory$companyPrefix",
  ]

  companyPrefixes = @["株式会社", "有限会社", "合同会社"]
  companyCategories = @["水産", "農林", "鉱業", "建設", "食品", "印刷", "電気", "ガス", "情報", "通信", "運輸", "銀行", "保険"]

proc companyPrefix*(f: Faker): string =
  ## ランダムに会社名の接頭語を返却する。
  runnableExamples:
    let f = newFaker("ja_JP")
    echo f.companyPrefix()
    ## Output:
    ##   株式会社

  f.rand.sample(companyPrefixes)

proc companyCategory*(f: Faker): string =
  ## ランダムに会社名のカテゴリを返却する。
  runnableExamples:
    let f = newFaker("ja_JP")
    echo f.companyCategory()
    ## Output:
    ##   電気

  f.rand.sample(companyCategories)

proc company*(f: Faker): string =
  ## ランダムに会社名を返却する。
  runnableExamples:
    let f = newFaker("ja_JP")
    echo f.company()
    ## Output:
    ##   株式会社田辺銀行

  let
    fmt = f.rand.sample(formats)
    companyPrefix = f.companyPrefix()
    companyCategory = f.companyCategory()
    lastName = f.lastName()
  fmt % @[
    "companyPrefix", companyPrefix,
    "companyCategory", companyCategory,
    "lastName", lastName,
  ]

proc bs*(f: Faker): string = discard
proc catchPhrase*(f: Faker): string = discard
proc companySuffix*(f: Faker): string = discard
