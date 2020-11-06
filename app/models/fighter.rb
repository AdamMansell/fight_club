# frozen_string_literal: true

class Fighter < ApplicationRecord
  validates :name, :age, :height, :weight, presence: true
end
