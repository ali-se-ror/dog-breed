# frozen_string_literal: true

class DogBreedService
  DOG_API_URL = 'https://dog.ceo/api/breed/'

  def initialize(breed)
    @breed = breed.downcase.split(' ').reverse.join('/')
  end

  def fetch_breed_image
    url = "#{DOG_API_URL}#{@breed}/images/random"
    response = ApiClient.get_data(url)
    response['status'] != 'error' && response['message']
  end
end
