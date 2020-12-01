class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '補助金・助成金' },
    { id: 2, name: '制度融資' }
  ]

  include ActiveHash::Associations
  has_many :articles
end