class Entity < ActiveRecord::Base
  belongs_to :entity_type
  has_many  :projects
end