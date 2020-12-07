class Post < ApplicationRecord
    belongs_to :user
    belongs_to :beer
    after_destroy :log_destroy_action

    def log_destroy_action
       puts 'Post(s) destroyed'
    end

    validates :text_area, presence: true
   
end
