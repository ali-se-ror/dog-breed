# frozen_string_literal: true

# spec/views/dogs/_breed_info.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'dogs/_breed_info.html.erb', type: :view do
  context 'when image_url is present' do
    let(:breed) { 'Hound' }
    let(:image_url) { 'https://example.com/image.jpg' }

    it 'renders breed information with image' do
      render partial: 'dogs/breed_info', locals: { breed:, image_url: }

      expect(rendered).to have_selector('.bg-white.shadow.rounded-lg.p-3') do |div|
        expect(div).to have_content("Bread Name: #{breed}")
        expect(div).to have_selector("img[src='#{image_url}']")
      end
    end
  end

  context 'when image_url is not present' do
    it 'renders a message indicating no matching breeds found' do
      render partial: 'dogs/breed_info', locals: { image_url: nil }

      expect(rendered).to have_selector('.bg-white.shadow.rounded-lg.px-5.py-6') do |div|
        expect(div).to have_content('No matching breeds found.')
      end
    end
  end
end
