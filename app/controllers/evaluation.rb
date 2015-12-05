get '/evaluation/annual_revenue/:revenue' do |revenue|
  @evaluation = Evaluation.new(annual_revenue: revenue.to_i)

  return @evaluation.result_json
end

get '/evaluation/annual_revenue/:revenue/credit_score/:score' do |revenue, score|
  @evaluation = Evaluation.new(annual_revenue: revenue.to_i, credit_score: score.to_i)

  return@evaluation.result_json
end
