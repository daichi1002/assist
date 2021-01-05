class Need < ActiveHash::Base
  self.data = [
    { id: 1, name:'売りたい'},
    { id: 2, name:'買いたい'}
  ]

  include ActiveHash::Associations
  has_many :companies
  has_many :users
end
