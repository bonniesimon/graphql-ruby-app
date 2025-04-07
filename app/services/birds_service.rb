class BirdsService
  API_ENDPOINT = "https://freetestapi.com/api/v1/birds"

  def birds(limit:20)
    response = HTTParty.get(API_ENDPOINT)

    response.take(limit)
  end

  def bird(id)
    response = HTTParty.get(API_ENDPOINT)

    response.filter { it["id"] == id }&.first || {}
  end
end
