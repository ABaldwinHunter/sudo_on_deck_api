require "spec_helper"
require "json"

describe "Evaluation" do
  describe "get_max" do
    it "returns a tenth of annual revenue" do
      annual_rev = 70000
      eval = Evaluation.new({ annual_revenue: annual_rev })
      max = eval.send(:max_amount)

      expect(max).to eq(7000)
    end

    it "in increments of 500" do
      annual_rev = 68000
      eval = Evaluation.new({ annual_revenue: annual_rev })
      max = eval.send(:max_amount)

      expect(max).to eq(6500)
    end

    it "returns no more than 10,000" do
      annual_rev = 1000000000000000000000
      eval = Evaluation.new({ annual_revenue: annual_rev })
      max = eval.send(:max_amount)

      expect(max).to eq(10000)
    end

    it "returns 0 when revenue < 5000" do
      annual_rev = 499
      eval = Evaluation.new({ annual_revenue: annual_rev })
      max = eval.send(:max_amount)

      expect(max).to eq(0)
    end
  end

  describe "min" do
    it "defaults to 500 when user is qualified" do
      annual_rev = 1000000000000000000000
      eval = Evaluation.new({ annual_revenue: annual_rev })
      min = eval.send(:min_amount)

      expect(min).to eq(500)
    end

    it "defaults to 0 when user is unqualified" do
      annual_rev = 499
      eval = Evaluation.new({ annual_revenue: annual_rev })
      min = eval.send(:min_amount)

      expect(min).to eq(0)
    end
  end
end
