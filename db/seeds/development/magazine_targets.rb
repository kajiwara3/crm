# coding: utf-8
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子　"]
fnames_kana = ["サトウ", "スズキ", "タカハシ", "タナカ"]
gnames_kana = ["タロウ", "ジロウ", "ハナコ"]

0.upto(9) do |magazine|
  0.upto(9) do |target|
    MagazineTarget.create(
      mail_magazine_id: magazine + 1,
      name: "#{fnames[target % 4]} #{gnames[target % 3]}",
      email: "test#{target}@a.com"
    )
  end
end
