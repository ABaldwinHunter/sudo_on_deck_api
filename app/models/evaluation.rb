require "json"

class Evaluation
  DEFAULT_CREDIT_SCORE = 650
  DEFAULT_LOAN_TERM = 6 # months
  DEFAULT_INTEREST_RATE = 0.10

  attr_reader :result_json

  def initialize(args)
    @annual_revenue = args[:annual_revenue]
    @credit_score = CreditScore.new(args[:credit_score] || DEFAULT_CREDIT_SCORE).quality
  end

  def result_json
    {
      approved: approved?,
      max: max_amount,
      min: min_amount,
      evaluation_date: Time.now
    }.to_json
  end

  private

  attr_reader :annual_revenue, :credit_score

  def approved?
    max_amount > 0
  end

  def max_amount
    return 0 if credit_score == "bad"
    @max_ammount ||=
      if annual_revenue >= 500000
        10000
      elsif annual_revenue >= 100000
        5000
      elsif annual_revenue >= 80000
        3000
      elsif annual_revenue >= 50000
        2000
      elsif annual_revenue >= 5000
        500
      else
        0
      end
  end

  def min_amount
    300
  end
end

# data gathering
# On deck

# 5k-10k, < 100,000 no
# 5k-10k, > 100,000 min pass
# 10k-100k
