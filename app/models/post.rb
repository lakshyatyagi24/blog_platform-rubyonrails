class Post < ApplicationRecord
    has_rich_text :content
  
    # Validations
    validates :title, presence: true, length: { maximum: 100 }
    validates :content, presence: true
  end
  