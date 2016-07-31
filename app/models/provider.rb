class Provider < ApplicationRecord
	belongs_to :category
	belongs_to :user

  has_many :address, dependent: :destroy
	has_many :languages, dependent: :destroy
	has_many :prices, dependent: :destroy
  has_many :replies, dependent: :destroy
	has_many :providers_skills


  	ratyrate_rateable "communication", "efficiency", "price", "punctuality", "overall"
	# after_validation :geocode          # auto-fetch coordinates

  	# validates :name, :description, :user_id, :domain_id, :presence => true

  	accepts_nested_attributes_for :address
  	# accepts_nested_attributes_for :skills, :allow_destroy => true
  	has_and_belongs_to_many :skills
    accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

end
