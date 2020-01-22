class Category < ApplicationRecord
  has_many :items
  #多階層の記述
  
  has_ancestry
end
