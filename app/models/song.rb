class Song < ActiveRecord::Base
  belongs_to :album

  attr_accessor :name

end
