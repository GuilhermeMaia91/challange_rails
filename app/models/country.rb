class Country < ApplicationRecord
  has_many :country_details

  validates_presence_of :name, :name_short

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "name_short", "updated_at"]
  end
end
