# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApiClient do
  describe '.get_data' do
    let(:url) { 'https://example.com/api/data' }

    context 'when API call is successful' do
      let(:response_body) { { 'status' => 'success', 'message' => 'Data fetched successfully' }.to_json }

      before do
        allow(Net::HTTP).to receive(:get_response).and_return(double(body: response_body))
      end

      it 'returns parsed JSON response' do
        expect(ApiClient.get_data(url)).to eq(JSON.parse(response_body))
      end
    end

    context 'when API call fails' do
      let(:error_message) { 'Failed to fetch data from the API' }

      before do
        allow(Net::HTTP).to receive(:get_response).and_raise(StandardError, error_message)
      end

      it 'logs error and returns error message' do
        expect(Rails.logger).to receive(:error).with("Error fetching data from the API: #{error_message}")
        expect(ApiClient.get_data(url)).to eq({ status: 'error', message: error_message })
      end
    end
  end
end
