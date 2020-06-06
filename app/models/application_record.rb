class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  class Sign_up < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture    
  end
end
