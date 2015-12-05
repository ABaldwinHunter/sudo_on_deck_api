class CreditScore
  attr_accessor :score
  attr_reader :quality

  def initialize(score)
    @score = score
  end

  def quality
    @quality ||=
      if score >= 750
        "excellent"
      elsif score >= 700
        "good"
      elsif score >= 650
        "fair"
      elsif score >= 600
        "poor"
      else
        "bad"
      end
  end
end
