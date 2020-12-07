class Beer < ApplicationRecord
    has_many :posts , dependent: :destroy
    has_many :users, through: :posts
    #has_many :user_posts, class_name: :User, through: :posts

    scope :abv_higher_than_5, ->{where('abv > 5')}

    validates :name, presence: true
    accepts_nested_attributes_for :posts
    

end
