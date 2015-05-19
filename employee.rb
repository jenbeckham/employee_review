require './setup.rb'

class Employee < ActiveRecord::Base
  belongs_to :departments

  def give_raise(dollar_amount)
    self.salary += dollar_amount
  end

  def add_review(review)
    review << review.downcase
  end
end
