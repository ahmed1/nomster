class Place < ApplicationRecord
  belongs_to :user
  validates :name, presence: true #prevent any new place to be saved without a name
end
