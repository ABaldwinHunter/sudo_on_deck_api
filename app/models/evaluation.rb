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
      approved: unqualified?,
      max: max_amount,
      min: min_amount,
      evaluation_date: Time.now
    }.to_json
  end

  private

  attr_reader :annual_revenue, :credit_score


  def max_amount
    @max_amount ||=
      if unqualified?
        0
      else
        get_max
      end
  end

  def min_amount
    unqualified? ? 0 : 500
  end

  def get_max
    if annual_revenue > 100000
      10000
    else
      ten_x = annual_revenue * 10
      ten_x - ten_x % 500
    end
  end

  def unqualified?
    credit_score == "bad" || annual_revenue < 5000
  end
end
