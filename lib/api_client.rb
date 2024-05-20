# frozen_string_literal: true

require 'net/http'
require 'json'

class ApiClient
  def self.get_data(url)
    response = Net::HTTP.get_response(URI(url))

    JSON.parse(response.body)
  rescue StandardError => e
    Rails.logger.error("Error fetching data from the API: #{e.message}")
    { status: 'error', message: e.message }
  end
end
