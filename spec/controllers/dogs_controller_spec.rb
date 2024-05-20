# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DogsController, type: :controller do
  describe 'GET #show' do
    let(:breed) { 'hound' }
    let(:image_url) { 'https://example.com/image.jpg' }

    context 'when breed is provided' do
      before do
        allow_any_instance_of(DogBreedService).to receive(:fetch_breed_image).and_return(image_url)
      end

      it 'renders turbo stream with breed info' do
        post :show, params: { breed: }, format: :turbo_stream
        expect(response).to render_template(partial: 'dogs/_breed_info')
      end
    end
  end
end
