# Dog Breed Image Fetcher

This repository contains a simple web application built with Ruby on Rails that fetches dog breed images from the Dog API and displays them along with the submitted dog breed name.

## Objective

The objective of this coding challenge is to assess technical skills and demonstrate how programming assignments are approached. The specifications are intentionally loose to allow flexibility in implementation.

## Challenge

Design a simple web form with a text input field labeled "Breed" and a "Submit" button. Upon form submission, a dog breed image should be fetched from the Dog API and displayed to the right of the web form, along with the submitted dog breed name.

### Requirements

- Ruby on Rails
- Bootstrap / Tailwind (optional but recommended)
- Git
- Asynchronous form submission without full page reload
- React (optional for views)

## Usage

1. Clone the repository:

- git clone https://github.com/ali-se-ror/dog-breed.git

2. Navigate to the project directory:

- cd dog-breed-image-fetcher

3. Install dependencies:

- bundle install

4. Start the Rails server:

- ./bin/dev

5. Open your web browser and go to http://localhost:3000 to view the application.

6. for runing test cases run command

- rspec

## Repository Structure

- app/controllers/dogs\_controller.rb: Controller responsible for handling form submissions and rendering views.
- app/services/dog\_breed\_service.rb: Service class for fetching dog breed images from the Dog API.
- app/views/dashboard/index.html.erb: View containing the form for breed input.
- app/views/dogs/\_breed\_info.html.erb: Partial for displaying the breed information and image.

## Assumptions

- The form submission is handled asynchronously using Turbo Streams for Rails.
- Tailwind is used for styling the form and layout.

