class SignupSerializer < ActiveModel::Serializer
  #attributes :id, :camper_id, :activity_id, :time: 
  #has_one :activity
  belongs_to :activity
end
