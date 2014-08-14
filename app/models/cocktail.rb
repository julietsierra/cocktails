class Cocktail < ActiveRecord::Base
  has_many :ingredients, through: :doses
  has_many :doses


  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where(:description, "%#{query}%")
   end


end
