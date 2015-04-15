class Player < ActiveRecord::Base


  def add_point
    self.number_correct += 1
    self.save
  end

  def subtract_point
    self.number_incorrect += 1
    self.save
  end

end
