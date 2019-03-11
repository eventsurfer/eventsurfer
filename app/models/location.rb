# frozen_string_literal: true

class Location < ApplicationRecord
  has_one :performance, through: :performance_locations

  ##
  #
  def self.getAllCountries
    countries = CS.countries
    arr = []
    countries.each_value do |loc|
      if loc == "country_name"

      else
        arr.push(loc)
      end
    end
    return arr.sort
  end
end
