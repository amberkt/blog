class Article < ApplicationRecord
    validates :title, presence: true, length: { minimim: 6, maximum: 100 } #require title to be present to be saved to db
    validates :descriptions, presence: true, length: { minimim: 10, maximum: 300 }
end

#Models need validations, 
#Without them, empty articles with no titles or descriptions ruin the integrity of the data. 
