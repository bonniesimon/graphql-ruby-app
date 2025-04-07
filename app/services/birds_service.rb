class BirdsService
  API_ENDPOINT = "https://freetestapi.com/api/v1/birds"

  def birds(limit:20)
    response = HTTParty.get(API_ENDPOINT)

    response.take(limit)
  end
end
