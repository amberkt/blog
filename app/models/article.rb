class Article < ApplicationRecord

    #require title to be present to be saved to db
    validates :title, presence: true, length: { minimum: 6, maximum: 100 } 
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }

    belongs_to :user
end

#Models need validations, 
#Without them, empty articles with no titles or descriptions ruin the integrity of the data. 
