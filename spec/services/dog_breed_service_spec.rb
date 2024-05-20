# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogBreedService do
  describe '#fetch_breed_image' do
    let(:breed) { 'hound' }
    let(:service) { described_class.new(breed) }

    context 'when API call is successful' do
      before do
        allow(ApiClient).to receive(:get_data).and_return({ 'status' => 'success',
                                                            'message' => 'https://example.com/image.jpg' })
      end

      it 'returns the image URL' do
        expect(service.fetch_breed_image).to eq('https://example.com/image.jpg')
      end
    end

    context 'when API call fails' do
      before do
        allow(ApiClient).to receive(:get_data).and_return({ 'status' => 'error' })
      end

      it 'returns nil' do
        expect(service.fetch_breed_image).to be_falsey
      end
    end
  end
end
