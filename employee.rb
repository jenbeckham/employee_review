require './setup.rb'

class Employee < ActiveRecord::Base
  belongs_to :departments
  
  def give_raise(dollar_amount)
    salary += dollar_amount
  end

  def add_review(review)
    reviews << review.downcase
  end

  def evaluate_review
    bad_array = []
    good_array = []
    reviews.each do |r|
    bad_array << r.scan(/(improve|[\S]success|difficult|[\S]happy|negative|[\S]consistent|[\S]effectiv|less|not|lack|[\S]productiv|inadequate|interrupt|poor|[\S]proficient|unsatisf|\s\more\s\w)/).flatten
    end
    @bad_comments = bad_array.flatten.count

    reviews.each do |r|
    good_array << r.scan(/(good|[\s]success|pleasure|[\s]happy|great|[\s]consistent|[\s]effectiv|[\s]satisf|[\s]productiv|[\s]perfect|outstand|excellent|postive|[\s]proficient|strong)/).flatten
    end
    @good_comments = good_array.flatten.count

    if @good_comments > @bad_comments
      "Satisfactorily"
    else
      "Unsatisfactorily"
    end
  end

  def rating_performance
    if @good_comments.to_f/(@good_comments+@bad_comments) < 0.25
      1
    elsif @good_comments.to_f/(@good_comments+@bad_comments) < 0.5
      2
    elsif @good_comments.to_f/(@good_comments+@bad_comments) < 0.75
      3
    else
      4
    end
  end

  # def work_performance(r)
  #   # @reviews
  #   if r == true
  #     @performance_rating = "Satisfactorily"
  #   else
  #     @performance_rating = "Unsatisfactorily"
  #   end
  # end
end
