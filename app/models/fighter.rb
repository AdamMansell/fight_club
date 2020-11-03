class Fighter < ApplicationRecord
  validates :name, :age, :height, :weight, presence: true
end
