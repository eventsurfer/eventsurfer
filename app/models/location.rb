# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :performance_locations
  has_many :performance, through: :performance_locations

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

  def self.getLocationsNames
    tmp = []
    loc = Location.all
    loc.each{|l|tmp.push(l.name)}
    return tmp
  end
end
