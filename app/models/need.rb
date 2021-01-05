class Need < ActiveHash::Base
  self.data = [
    { id: 1, name:'売り'},
    { id: 2, name:'買い'}
  ]

  include ActiveHash::Associations
  has_many :companies
  has_many :users
end
