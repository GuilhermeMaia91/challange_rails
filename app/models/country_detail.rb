class CountryDetail < ApplicationRecord
  belongs_to :country

  validates_presence_of :observation

  def self.ransackable_attributes(auth_object = nil)
    ["country_id", "created_at", "id", "observation", "picture", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["country"]
  end
end
