class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '新型コロナウイルス' },
    { id: 2, name: 'IT関連' },
    { id: 3, name: '観光・インバウンド' },
    { id: 4, name: '起業・ベンチャー' },
    { id: 5, name: '人材育成・雇用' },
    { id: 6, name: '経営改善・経営強化' },
    { id: 7, name: '海外展開' },
    { id: 8, name: '研究・技術・産学連携' },
    { id: 9, name: '特許・知的財産' },
    { id: 10, name: '設備導入・運転資金' },
    { id: 11, name: '企業再生・事業承継' },
    { id: 12, name: '地域活性化・まちづくり' },
    { id: 13, name: '被災者支援' },
    { id: 14, name: '環境・省エネ' },
    { id: 15, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
