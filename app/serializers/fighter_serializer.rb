class FighterSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :weight, :height, :type_of_fighter, :created_at

  def created_at
    object.created_at.strftime("%d/%m/%Y")
  end
end
