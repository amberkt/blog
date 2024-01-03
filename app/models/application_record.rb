class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

#All models will extend / inherit this file