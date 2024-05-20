# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dashboard/index.html.erb', type: :view do
  it 'renders the form for breed input' do
    render

    expect(rendered).to have_selector("form[action='#{dogs_path}'][method='post']") do |form|
      expect(form).to have_selector("input[type='text'][name='breed'][placeholder='Enter breed...']")
      expect(form).to have_selector("input[type='submit'][value='Submit']")
    end
  end
end
