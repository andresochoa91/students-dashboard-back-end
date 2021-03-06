class TmaterialSerializer < ActiveModel::Serializer
  attributes [
    :id, 
    :title, 
    :link, 
    :platform, 
    :treehouse_type, 
    :instructor, 
    :duration, 
    :learning_objectives, 
    :tools, 
    :notes
  ] 

  has_many :tlessons
  
end
