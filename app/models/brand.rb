class Brand < ApplicationRecord

    has_many :campaigns

    validates :name, presence: true
    #validates_date :year_founded, :on => :create, :on_or_before => :today
    validates :description, length: {minimum: 10}

    #     #scrapping this
    # has_secure_password
    
end
