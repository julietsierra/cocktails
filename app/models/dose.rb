class Dose < ActiveRecord::Base
  belongs_to :ingredients
  belongs_to :cocktails
end
