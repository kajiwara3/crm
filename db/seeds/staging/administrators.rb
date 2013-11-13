# coding: utf-8
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子　"]

0.upto(9) do |idx|
  Administrator.create(
    name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    email: "admin#{idx}@a.com",
    password: "password",
    password_confirmation: "password"
  )
end