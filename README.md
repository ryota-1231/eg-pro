Eg Pro
====
  'Eg Pro' はこれからエンジニアを目指す人が、学習を続けられるように楽しみながら学べる学習プラットフォームです。

# Description
  今までの教育プログラムの多くは、カリキュラムの作成者からの一方的な教授が多いですが、このサービスでは、カリキュラムのゴールは設定してあるものの、
  そこに至るまでのカリキュラムはユーザーの投稿によって自由に設定ができます。
  
  学習するにあたって、同じことを伝えようとしても伝え方のニュアンスの違いによって、理解度が変わることは往々にしてあると思います。
  この学習プラットフォームの目的は下記の通りです。
    ・より多くのかたのカリキュラムを体験することで、理解度を深める
    ・理解したら即座にアウトプットすることでさらなる知識定着ができる。
    
  エンジニアになるための知識を教え合う場所を提供します。

  
# Demo

カリキュラム（順次対応予定）
[![Image from Gyazo](https://i.gyazo.com/4bbf90688ba45b413a782a1f555f55e5.png)](https://gyazo.com/4bbf90688ba45b413a782a1f555f55e5)

カリキュラムのゴール（プログラムに組み込まれています）
[![Image from Gyazo](https://i.gyazo.com/60ed4e6e8a046cb520429b977a05e6d4.gif)](https://gyazo.com/60ed4e6e8a046cb520429b977a05e6d4)

カリキュラムの投稿
[![Image from Gyazo](https://i.gyazo.com/1987b4606d2a65f14ed64f91cd8a245e.png)](https://gyazo.com/1987b4606d2a65f14ed64f91cd8a245e)

[![Image from Gyazo](https://i.gyazo.com/3cd5adea77195cfd5912261590dc4975.png)](https://gyazo.com/3cd5adea77195cfd5912261590dc4975)



# 苦労した点
- カリキュラムの投稿時のデータ一括で登録。複数のレコードを保存するために、 擬似的に複数のインスタンスを持った配列上のインスタンスを用意し実装した。
 
 
# 工夫した点
- カリキュラムの投稿時に、実際のカリキュラムの進行と同じようにスワイパーを導入して、 実際に動かした時のイメージをそのまま感じていただけるように実装した。
 
 
# 今後実装したいこと
- カリキュラムの充実
- ユーザーの学習進捗や継続日数、カリキュラムの作成数などに応じて「メダル」を発行し、 それを集めることでモチベーションアップになるようにしたい。
- カリキュラム終了後に簡単なアンケートを取っているため（理解度の３段階評価）、その評価によって 　カリキュラムの選択時に優先的に上位に表示することで、評価されているカリキュラムを体験しやすいようにしたい
- SNSと連携し、すぐに自分の成果をすぐアウトプットできる状態にしたい


# DB

[![Image from Gyazo](https://i.gyazo.com/b2db5cdf8e8599fb2cc93e7ee8d0b3b5.png)](https://gyazo.com/b2db5cdf8e8599fb2cc93e7ee8d0b3b5)


