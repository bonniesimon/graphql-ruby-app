Searchkick.client = OpenSearch::Client.new(
  hosts: [{
    host: "localhost",
    port: 9200,
    scheme: "https",
    user: "admin",
    password: ENV["OPENSEARCH_ADMIN_PASSWORD"],
  }],
  retry_on_failure: true,
  transport_options: {
    request: { timeout: 120 },
    ssl: { verify: false }
  }
)
