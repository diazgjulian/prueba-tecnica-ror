# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  API_ADDRESS = 'https://api.chucknorris.io/jokes'

end
