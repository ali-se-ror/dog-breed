# frozen_string_literal: true

class DogsController < ApplicationController
  def show
    breed = params[:breed]
    image_url = DogBreedService.new(breed).fetch_breed_image

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          'breed_info', partial: 'dogs/breed_info',
                        locals: {
                          breed:,
                          image_url:
                        }
        )
      end
    end
  end
end
