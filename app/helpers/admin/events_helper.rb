# frozen_string_literal: true

module Admin::EventsHelper
  def getFullAddress(location)
    location.street + " " + location.street_number + ", " + location.postcode + " " + location.city + " " + location.country
  end
end
