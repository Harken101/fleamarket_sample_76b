# 親カテゴリ作成
parent1  = Category.create(name: 'レディース')
parent2  = Category.create(name: 'メンズ')
parent3  = Category.create(name: 'ベビー・キッズ')
parent4  = Category.create(name: 'インテリア・住まい・小物')
parent5  = Category.create(name: '本・音楽・ゲーム')
parent6  = Category.create(name: 'おもちゃ・ホビー・グッズ')
parent7  = Category.create(name: 'コスメ・香水・美容')
parent8  = Category.create(name: '家電・スマホ・カメラ')
parent9  = Category.create(name: 'スポーツ・レジャー')
parent10 = Category.create(name: 'ハンドメイド')
parent11 = Category.create(name: 'チケット')
parent12 = Category.create(name: '自動車・オートバイ')
parent13 = Category.create(name: 'その他')

# レディース
ladies_child_array = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']
ladies_grandchild_array = [
  # トップス
  ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他'], 
  # ジャケット/アウター
  ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他'], 
  # パンツ
  ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他'], 
  # スカート
  ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他'], 
  # ワンピース
  ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他'], 
  # 靴
  ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他'], 
  # ルームウェア
  ['パジャマ','ルームウェア'], 
  # レッグウェア
  ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他'], 
  # 帽子
  ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他'], 
  # バッグ
  ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他'], 
  # アクセサリー
  ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他'], 
  # ヘアアクセサリー
  ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他'], 
  # 小物
  ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他'], 
  # 時計
  ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他'], 
  # ウィッグ/エステ
  ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他'], 
  # 浴衣/水着
  ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他'], 
  # スーツ/フォーマル/ドレス
  ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他'], 
  # マタニティ
  ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他'], 
  # その他
  ['コスプレ','下着','その他']
]
ladies_child_array.each_with_index do |child, i|
  child = parent1.children.create(name: child)
  ladies_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# メンズ
mens_child_array = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他']
mens_grandchild_array = [
  # トップス
  ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','チュニック','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他'], 
  # ジャケット/アウター
  ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','その他'], 
  # パンツ
  ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','その他'], 
  # 靴
  ['スニーカー','ブーツ','サンダル','その他'],
  # バッグ 
  ['ショルダーバッグ','トートバッグ','ボストンバッグ','その他'], 
  # スーツ
  ['スーツジャケット','スーツベスト','スラックス','その他'], 
  # 帽子
  ['キャップ','ハット','ニットキャップ','その他'], 
  # アクセサリー
  ['ネックレス','ブレスレット','バングル/リストバンド','その他'], 
  # 小物
  ['長財布','折り財布','マネーグリップ','その他'],
  # 時計 
  ['腕時計（アナログ）','腕時計（デジタル）','ラバーベルト','その他'], 
  # 水着
  ['一般水着','スポーツ用','アクセサリー','その他'], 
  # レッグウェア
  ['ソックス','レギンス/スパッツ','レッグウォーマー','その他'], 
  # アンダーウェア
  ['トランクス','ボクサーパンツ','その他'], 
  # その他
  ['コスプレ','その他'], 
]
mens_child_array.each_with_index do |child, i|
  child = parent2.children.create(name: child)
  mens_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# ベビーキッズ
baby_child_array = ['ベビー服','キッズ服','その他']
baby_grandchild_array = [
  # ベビー服
  ['トップス','その他'], 
  # キッズ服
  ['コート','その他'], 
  # その他
  ['おしゃぶり','その他'], 
]
baby_child_array.each_with_index do |child, i|
  child = parent3.children.create(name: child)
  baby_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# インテリア・住まい・小物
interior_child_array = ['キッチン/食器','ベッド/マットレス','その他']
interior_grandchild_array = [
  # キッチン/食器
  ['食器','その他'], 
  # ベッド/マットレス
  ['二段ベッド','その他'], 
  # その他
  ['たいまつ','その他'], 
]
interior_child_array.each_with_index do |child, i|
  child = parent4.children.create(name: child)
  interior_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 本・音楽・ゲーム
game_child_array = ['本','ゲーム','その他']
game_grandchild_array = [
  # 本
  ['小説','その他'], 
  # ゲーム
  ['PCゲーム','その他'], 
  # その他
  ['ボードゲーム','その他'], 
]
game_child_array.each_with_index do |child, i|
  child = parent5.children.create(name: child)
  game_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# おもちゃ・ホビー・グッズ
toy_child_array = ['おもちゃ','ホビー','その他']
toy_grandchild_array = [
  # おもちゃ
  ['ミニカー','その他'], 
  # ホビー
  ['ガンプラ','その他'], 
  # その他
  ['マニアグッズ','その他'], 
]
toy_child_array.each_with_index do |child, i|
  child = parent6.children.create(name: child)
  toy_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# コスメ・香水・美容
cosme_child_array = ['ベースメイク','香水','その他']
cosme_grandchild_array = [
  # ベースメイク
  ['ファンデーション','その他'], 
  # 香水
  ['香水（女性用）','その他'], 
  # その他
  ['オカルトダイエットサプリ','その他'], 
]
cosme_child_array.each_with_index do |child, i|
  child = parent7.children.create(name: child)
  cosme_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 家電・スマホ・カメラ
camera_child_array = ['スマホ','カメラ','その他']
camera_grandchild_array = [
  # スマホ
  ['ipple','その他'], 
  # カメラ
  ['デジタルカメラ','その他'], 
  # その他
  ['怪しい電化製品','その他'], 
]
camera_child_array.each_with_index do |child, i|
  child = parent8.children.create(name: child)
  camera_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# スポーツ・レジャー
sport_child_array = ['ゴルフ','自転車','その他']
sport_grandchild_array = [
  # ゴルフ
  ['アイアン','その他'], 
  # 自転車
  ['ロードバイク','その他'], 
  # その他
  ['プロテイン','その他'], 
]
sport_child_array.each_with_index do |child, i|
  child = parent9.children.create(name: child)
  sport_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# ハンドメイド
handmaid_child_array = ['アクセサリー（女性用）','日用品/インテリア','その他']
handmaid_grandchild_array = [
  # アクセサリー（女性用）
  ['ペンダント','その他'], 
  # 日用品/インテリア
  ['マスク','その他'], 
  # その他
  ['手作りクッキー☆','その他'], 
]
handmaid_child_array.each_with_index do |child, i|
  child = parent10.children.create(name: child)
  handmaid_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# チケット
ticket_child_array = ['音楽','スポーツ','その他']
ticket_grandchild_array = [
  # 音楽
  ['コンサート','その他'], 
  # スポーツ
  ['野球観戦','その他'], 
  # その他
  ['2020年東京オリンピック！','その他'], 
]
ticket_child_array.each_with_index do |child, i|
  child = parent11.children.create(name: child)
  ticket_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# 自動車・オートバイ
car_child_array = ['自動車本体','部品','その他']
car_grandchild_array = [
  # 自動車本体
  ['クーペ','その他'], 
  # 部品
  ['エンジン','その他'], 
  # その他
  ['スクラップ','その他'], 
]
car_child_array.each_with_index do |child, i|
  child = parent12.children.create(name: child)
  car_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end

# その他
other_child_array = ['食品','ペット用品','その他']
other_grandchild_array = [
  # 食品
  ['米俵','その他'], 
  # ペット用品
  ['ドッグフード','その他'], 
  # その他
  ['その他のその他ってなんだよ','ダークマター','その他'], 
]
other_child_array.each_with_index do |child, i|
  child = parent13.children.create(name: child)
  other_grandchild_array[i].each do |grandchild|
    child.children.create(name: grandchild)
  end
end